//
//  Post.swift
//  LetsDrink
//
//  Created by Al Akdari on 2021-01-03.
//  Copyright © 2021 AlCo. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class Post {
    // properties and methods
    var key: String?
    let imageURL: String
    let imageHeight: CGFloat
    let creationDate: Date
    
    //create dict to convert posts into dictionaries of type [String : Any]
    var dictValue: [String : Any] {
        let createdAgo = creationDate.timeIntervalSince1970
        
        return ["image_url" : imageURL,
                "image_height" : imageHeight,
                "created_at" : createdAgo]
    }
    
    
    init(imageURL: String, imageHeight: CGFloat) {
        self.imageURL = imageURL
        self.imageHeight = imageHeight
        self.creationDate = Date()
    }
    
    // Failable initialer to take a data snapshot
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let imageURL = dict["image_url"] as? String,
            let imageHeight = dict["image_height"] as? CGFloat,
            let createdAgo = dict["created_at"] as? TimeInterval
            else { return nil }

        self.key = snapshot.key
        self.imageURL = imageURL
        self.imageHeight = imageHeight
        self.creationDate = Date(timeIntervalSince1970: createdAgo)
    }
}
