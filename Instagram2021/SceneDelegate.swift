//
//  SceneDelegate.swift
//  Instagram2021
//
//  Created by Yujeong Lee on 10/20/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let navAppearnce = UINavigationBar.appearance()
        navAppearnce.barTintColor = UIColor(red: 156.0/255.0, green: 175.0/255.0, blue: 136.0/255.0, alpha: 1.0) // nav bar color is ~sage~
        navAppearnce.backgroundColor = UIColor(red: 156.0/255.0, green: 175.0/255.0, blue: 136.0/255.0, alpha: 1.0)
        navAppearnce.tintColor = UIColor.white // vector(?) logos will appear white, instead of system blue
        navAppearnce.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white] // view controller title will appear white
        
        
        // set global label, textField, and button font to SFMono
        let labelAppearance = UILabel.appearance()
        labelAppearance.font = UIFont.init(name: "SFMono", size: 16.0)

        let textFieldAppearance = UITextView.appearance()
        textFieldAppearance.font = UIFont.init(name: "SFMono", size: 16.0)
                
        let buttonAppearance = UIButton.appearance().titleLabel
        buttonAppearance?.font = UIFont.init(name: "SFMono", size: 16.0)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

