//
//  LoginViewController.swift
//  Instagram2021
//
//  Created by Yujeong Lee on 10/20/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
//        user.signUpInBackground(block: <#T##PFBooleanResultBlock?##PFBooleanResultBlock?##(Bool, Error?) -> Void#>)
        
        user.signUpInBackground {
            (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
              let errorString = error.localizedDescription
              // Show the errorString somewhere and let the user try again.
            } else {
              // Hooray! Let them use the app now.
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
          }
        
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
