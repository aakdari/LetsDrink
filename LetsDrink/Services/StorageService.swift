//
//  StorageService.swift
//  LetsDrink
//
//  Created by Al Akdari on 2021-01-03.
//  Copyright © 2021 AlCo. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage

struct StorageService {
    // provide method for uploading images

static func uploadImage(_ image: UIImage, at reference: StorageReference, completion: @escaping (URL?) -> Void) {
    //1 change image from UIImage to data
    guard let imageData = image.jpegData(compressionQuality: 0.1) else {
        return completion(nil)
    }
    
    //2 upload data to the path provided to the method
    reference.putData(imageData, metadata: nil, completion: { (metadata, error) in
        
        //3 if there is an error in uploading then use assertion error to crash application
        if let error = error {
            assertionFailure(error.localizedDescription)
            return completion(nil)
        }
        
        //4 if it works then call download URL to get a link
        reference.downloadURL(completion: { (url, error) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
        })
    })
}
}
