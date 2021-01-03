//
//  MGPhotoHelper.swift
//  LetsDrink
//
//  Created by Al Akdari on 2021-01-01.
//  Copyright © 2021 AlCo. All rights reserved.
//

import UIKit

class MGPhotoHelper: NSObject {
    

    // MARK: - Properties
    
    var completionHandler: ((UIImage) -> Void)?
    
    // MARK: - Helper Methods
    
    func presentActionSheet(from viewController: UIViewController) {
        // 1
        let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .actionSheet)
        
        // 2
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                // 3
            let capturePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: { action in
                self.presentImagePickerController(with: .camera, from: viewController)
                // do nothing yet..
            })
            
            // 4
            alertController.addAction(capturePhotoAction)
        }
        
        // 5
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let uploadAction = UIAlertAction(title: "Upload from Library", style: .default, handler: { action in
                // don't do anything yet
                self.presentImagePickerController(with: .photoLibrary, from: viewController)
            })
        
            alertController.addAction(uploadAction)
        }
        
        // 6
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // 7
        viewController.present(alertController, animated: true)
    }
    
    func presentImagePickerController(with sourceType: UIImagePickerController.SourceType, from viewController: UIViewController) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        imagePickerController.mediaTypes = ["public.image"]
        
        viewController.present(imagePickerController, animated: true)
    }
}

extension MGPhotoHelper: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                completionHandler?(selectedImage)
        }
        
        picker.dismiss(animated: true)
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
