//
//  HomeViewController.swift
//  LetsDrink
//
//  Created by user158235 on 10/14/20.
//  Copyright © 2020 AlCo. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class HomeViewController: UIViewController{
    
    //MARK - empty array of posts
    var posts = [Post]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //Mark - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserService.posts(for: User.current) { (posts) in
               self.posts = posts
               self.tableView.reloadData()
        }
    }
    
    func configureTableView() {
        // remove separators for empty cells
        tableView.tableFooterView = UIView()
        // remove separators from cells
        tableView.separatorStyle = .none
    }
}


//MARK - make this compatible with tableview data source
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostImageCell", for: indexPath) as! PostImageCell
        
        let imageURL = URL(string: post.imageURL)
        cell.postImageView.kf.setImage(with: imageURL)
        
        return cell
    }
}

// MARK: - UITableViewDelegate - make this compatible with the tableviewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let post = posts[indexPath.row]

        return post.imageHeight
    }
}

