//
//  PostHeaderCell.swift
//  LetsDrink
//
//  Created by Al Akdari on 2021-01-17.
//  Copyright © 2021 AlCo. All rights reserved.
//

import Foundation
import UIKit

class PostHeaderCell: UITableViewCell {
    
    static let height: CGFloat = 54
    
    //label for post header
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //when you hit the button
    @IBAction func optionsButtonTapped(_ sender: UIButton) {
        print("options button tapped")
    }
}
