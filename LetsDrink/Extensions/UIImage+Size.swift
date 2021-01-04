//
//  UIImage+Size.swift
//  LetsDrink
//
//  Created by Al Akdari on 2021-01-04.
//  Copyright © 2021 AlCo. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    var aspectHeight: CGFloat {
        // using height & width for iphone 8 plus
        let heightRatio = size.height / 736
        let widthRatio = size.width / 414
        let aspectRatio = fmax(heightRatio, widthRatio)
        
        return size.height / aspectRatio
    }
}
