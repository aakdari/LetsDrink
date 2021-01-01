//
//  User.swift
//  LetsDrink
//
//  Created by user158235 on 9/21/20.
//  Copyright © 2020 AlCo. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot
import Firebase



class User: Codable {
    
    // MARK: - Properties
    
    let uid: String
    let username: String
    
    // MARK: - Init
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
    }
    
    
    // 1
    private static var _current: User?

    // 2
    static var current: User {
            // 3
        guard let currentUser = _current else {
                fatalError("Error: current user doesn't exist")
        }
        
        // 4
        return currentUser
        
    }

    // MARK: - Class Methods

    // 1
    static func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        // 2
        if writeToUserDefaults {
                // 3
            if let data = try? JSONEncoder().encode(user) {
                    // 4
                UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
            }
        }
        _current = user
    }

}
