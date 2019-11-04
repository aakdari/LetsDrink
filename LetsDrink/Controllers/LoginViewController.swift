//
//  LoginViewController.swift
//  LetsDrink
//
//  Created by user158235 on 11/3/19.
//  Copyright © 2019 AlCo. All rights reserved.
//

import Foundation
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseUI

class LoginViewController: UIViewController {
    
   
    //Outlets
    
    @IBOutlet weak var loginButton: UIButton!
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    //Actions
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        // access FUIAuth
        let authUI = FUIAuth.defaultAuthUI()
            authUI?.delegate = self as? FUIAuthDelegate
            
            let providers: [FUIAuthProvider] = [
                FUIFacebookAuth()
        ]
            authUI?.providers = providers
            
            let authViewController = authUI?.authViewController()
            self.present(authViewController!, animated: true) {}
        
        print("button pressed")
    }
    
    
}
