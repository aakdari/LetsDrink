//
//  LoginViewController.swift
//  LetsDrink
//
//  Created by user158235 on 11/3/19.
//  Copyright © 2019 AlCo. All rights reserved.
//

import Foundation
import Firebase
import FirebaseCore
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseUI
import FirebaseAuth

class LoginViewController: UIViewController {
    
   
    //Outlets
    
    @IBOutlet weak var loginButton: UIButton!
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    //Actions
    
   
    @IBAction func loginButtonPressed(_ sender: Any) {
        //access FUIAuth
        let authUI = FUIAuth.defaultAuthUI()
           authUI?.delegate = self as? FUIAuthDelegate
            
          let providers: [FUIAuthProvider] = [
              FUIFacebookAuth()
        ]
            authUI?.providers = providers
           
            let authViewController = authUI?.authViewController()
            self.present(authViewController!, animated: true) {}
        
        print("button pressed")
       
        //if Auth.auth().currentUser != nil {
            // user is signed in
       //     let userInfo = Auth.auth().currentUser?.providerData[indexPath.row]cell?.textLabel?.text = userInfo?.providerID
            //provider specific UID
            
            
    }
    
    // MARK: -  IBActions
    
//func loginButtonTapped(_ sender: UIButton) {
            // 1
  //      let authUI = FUIAuth.defaultAuthUI()
    
        // 2
   //     authUI.delegate = self as! FUIAuthDelegate
        
        // 3
    //let authViewController = authUI?.authViewController()
        //present(authViewController, animated: true)
    //}
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication =  options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
                return true
            }
            // other URL handling goes here
            return false
    }
    

//extension LoginViewController: FUIAuthDelegate {
//       func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
 //              print("handle user singup / login")
 //      }
 //  }
}
