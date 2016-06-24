//
//  FBLoginViewController.swift
//  Meme Generator
//
//  Created by Joel Graycar on 12/7/15.
//  Copyright © 2015 Joel Graycar. All rights reserved.
//

import UIKit

class FBLoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    var loginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        loginButton.delegate = self
        
        if FBSDKAccessToken.currentAccessToken() != nil {
            // User is already logged in
            let memeCollectionViewController = self.storyboard?.instantiateViewControllerWithIdentifier("memesCollectionView") as? MemesCollectionViewController
            self.navigationController?.pushViewController(memeCollectionViewController!, animated: false)
        }
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if (error) != nil {
            // Process error
        } else if result.isCancelled {
            // Handle cancellations
        } else {
            // Successful login
            let memeCollectionViewController = self.storyboard?.instantiateViewControllerWithIdentifier("memesCollectionView") as? MemesCollectionViewController
            self.navigationController?.pushViewController(memeCollectionViewController!, animated: false)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }

}
