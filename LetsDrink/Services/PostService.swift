//
//  PostService.swift
//  LetsDrink
//
//  Created by Al Akdari on 2021-01-03.
//  Copyright © 2021 AlCo. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseDatabase

struct PostService {

static func create(for image: UIImage) {
    let imageRef = StorageReference.newPostImageReference()
    StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
        guard let downloadURL = downloadURL else {
            return
        }
        
        let urlString = downloadURL.absoluteString
        let aspectHeight = image.aspectHeight
        print("image url: \(urlString)")
        create(forURLString: urlString, aspectHeight: aspectHeight)
    }
}
    
    private static func create(forURLString urlString: String, aspectHeight: CGFloat) {
        //1 create reference to current user
        let currentUser = User.current
        
        //2 initialize a post with the passed through parameters
        let post = Post(imageURL: urlString, imageHeight: aspectHeight)
        
        //3 create a dictionary so post can be written as JSON in db
        let dict = post.dictValue
        
        //4 construct relative path to the location where we store new post data
        let postRef = Database.database().reference().child("posts").child(currentUser.uid).childByAutoId()
        
        //5 write the post back to the db
        postRef.updateChildValues(dict)
    }
}
