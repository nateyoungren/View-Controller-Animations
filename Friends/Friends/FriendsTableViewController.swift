//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Nathanael Youngren on 2/7/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        friendController.addFriends(list: list)
        navigationController?.delegate = navigationControllerDelegate
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendController.friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Friend", for: indexPath)
        
        let friend = friendController.friends[indexPath.row]
        let friendName = friend.name.capitalized
        let friendImage = UIImage(named: friend.name)
        
        cell.textLabel?.text = friendName
        cell.imageView?.image = friendImage
        
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = self
        if segue.identifier == "Detail" {
            guard let detailVC = segue.destination as? DetailViewController,
            let index = tableView.indexPathForSelectedRow else { return }
            detailVC.friend = friendController.friends[index.row]
            let cell = tableView.cellForRow(at: index)
            navigationControllerDelegate.sourceCell = cell
//            detailVC.delegate = navigationControllerDelegate
        }
    }
    
    let navigationControllerDelegate = NavigationControllerDelegate()
    
    let animator = Animator()
    
    let friendController = FriendController()
    
    let list = ["rachel": "I'm gonna go get one of those job things.",
                "ross": "I'm the holiday armadillo!",
                "monica": "I'm breezy!",
                "chandler": "So it seems like this internet thing is here to stay, huh?",
                "phoebe": "Thank you, my babies.",
                "joey": "Well the fridge broke, so I had to eat everything."]
}
