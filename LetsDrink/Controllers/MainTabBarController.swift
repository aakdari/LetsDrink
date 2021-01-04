//
//  MainTabBarController.swift
//  LetsDrink
//
//  Created by Al Akdari on 2021-01-01.
//  Copyright © 2021 AlCo. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    var photoHelper = MGPhotoHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoHelper.completionHandler = { image in
            print("handle image", image)
            PostService.create(for: image)
        }
        
        // 1
        delegate = self
        // 2
        tabBar.unselectedItemTintColor = .black
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
            //present photo taking action sheet
            print("take photo")
            
            photoHelper.presentActionSheet(from: self)
            return false
        }
        return true
    }
}
