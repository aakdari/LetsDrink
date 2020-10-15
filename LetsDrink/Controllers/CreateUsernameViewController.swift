//
//  CreateUsernameViewController.swift
//  LetsDrink
//
//  Created by user158235 on 10/9/20.
//  Copyright © 2020 AlCo. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
    // ....
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 6
    }
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // 1
        print("next button tapped\n")
        guard let firUser = Auth.auth().currentUser, let username = usernameTextField.text, !username.isEmpty else { return}
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else { return }
            print("Created new user: \(user.username)")
        
            User.setCurrent(user, writeToUserDefaults: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        
        if let initialViewController = storyboard.instantiateInitialViewController() {
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
        }
    }
}
