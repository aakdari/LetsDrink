//
//  HomeViewController.swift
//  LetsDrink
//
//  Created by user158235 on 10/14/20.
//  Copyright © 2020 AlCo. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    
    //MARK - empty array of posts
    var posts = [Post]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //Mark - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UserService.posts(for: User.current) { (posts) in
               self.posts = posts
               self.tableView.reloadData()
        }
        
    }
}


//MARK - make this compatible with tableview data source
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostImageCell", for: indexPath)
                cell.backgroundColor = .red
        return cell
    }
}

