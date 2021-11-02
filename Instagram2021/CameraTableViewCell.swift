//
//  CameraTableViewCell.swift
//  Instagram2021
//
//  Created by Yujeong Lee on 11/1/21.
//

import UIKit

class CameraTableViewCell: UITableViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var openCamera: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // open up the photo library when image view is tapped. make sure the image view has 'user interaction enabled' to recognize tap gesture
    // Allow user to open the camera. Opens Photo Library if camera not available (simulator).
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
        return true
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
        openCamera.image = scaledImage
        dismiss(animated: true, completion: nil)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
