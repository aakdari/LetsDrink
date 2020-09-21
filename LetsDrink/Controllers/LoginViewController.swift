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
import FirebaseUI
import FirebaseAuth
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
   
    //Outlets
    
    @IBOutlet weak var loginButton: UIButton!
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    //Actions
   
       
    // MARK: -  IBActions
    
@IBAction func loginButtonTapped(_ sender: UIButton) {
            // 1
    guard let authUI = FUIAuth.defaultAuthUI()
        else { return }
    authUI.delegate = self
    
      let providers: [FUIAuthProvider] = [
                FUIFacebookAuth(),
                FUIEmailAuth()
          ]
              authUI.providers = providers
        // 2
    
        
        // 3
    let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    
    // 1
    if let user = Auth.auth().currentUser {
        // 2
        let rootRef = Database.database().reference()
        // 3
        let userRef = rootRef.child("users").child(user.uid)
    
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            // 1
            if let userDict = snapshot.value as? [String : Any] {
                print("now to print dictionary")
                print(userDict.debugDescription)
            }
            
            // 2 handle snapshot containing data
        })
    }
    
    
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication =  options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
                return true
            }
            // other URL handling goes here
            return false
    }
    


}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let error = error {
                assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        
        guard let user = authDataResult?.user
            else { return }
        
        let userRef = Database.database().reference().child("users").child(user.uid)
        
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let user = User(snapshot: snapshot) {
                print("Welcome back, \(user.username).")
            } else {
                    print("New user!")
            }
            
        })
        
               print("handle user signup / login")
       }
   }
