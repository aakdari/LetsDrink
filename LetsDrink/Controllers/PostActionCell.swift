//
//  PostActionCell.swift
//  LetsDrink
//
//  Created by Al Akdari on 2021-01-17.
//  Copyright © 2021 AlCo. All rights reserved.
//

import Foundation
import UIKit

class PostActionCell: UITableViewCell {
    
    static let height: CGFloat = 46
    
    @IBOutlet weak var drinkButton: UIButton!
    @IBOutlet weak var drinkCountLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    //standard awake from nib stuff
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
    }
    
    //Logic for drink button
    @IBAction func drinkButtonTapped(_ sender: UIButton) {
        print("drink button tapped")
    }
}
