//
//  CameraViewController.swift
//  Instagram2021
//
//  Created by Yujeong Lee on 10/30/21.
//

import UIKit
import Parse
import AlamofireImage

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionField: UITextField!
    
    // Allow user to open the camera. Opens Photo Library if camera not available (simulator). Make sure the image view has 'user interaction enabled' to recognize tap gesture
    @IBAction func onCameraButton(_ sender: Any) {
        print("Opening camera if available")
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true

        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            print("Camera not available. Opening Photo Library instead")
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }

    // Allow user to pick from Photo Library
    @IBAction func onLibraryButton(_ sender: Any) {
        print("Opening photo library")
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.sourceType = .photoLibrary
        } else {
            print("Photo library is not available")
        }
        present(picker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width:300, height: 300)
        let scaledImage = image.af.imageScaled(to: size)
        imageView.image = scaledImage
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onSubmitButton(_ sender: Any) {
        print("Submit button pressed")
        let posts = PFObject(className: "Posts")
        posts["user"] = PFUser.current()! // user currently logged in
        posts["caption"] = captionField.text!
        
        let imageData = imageView.image!.pngData()
        let imageFile = PFFileObject(data: imageData!)
        posts["image"] = imageFile
        
        posts.saveInBackground { (succeeded, error) in
            if (succeeded) {
                print("Your post is saved successfully")
                self.dismiss(animated: true, completion: nil)
            } else {
                print("There was an error with saving your post. Here is the error message: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    // allow tapping outside of the textfield to dismiss keyboard
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
//        view.addSubview(navBar)
//        let navItem = UINavigationItem(title: "SomeTitle")
//        navBar.setItems([navItem], animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
