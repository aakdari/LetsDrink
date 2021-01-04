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
}
