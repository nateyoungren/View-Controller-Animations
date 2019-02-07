//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Nathanael Youngren on 2/7/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Friend", for: indexPath)
        
        return cell
    }
    
    let friendController = FriendController()
    
    let list = ["rachel": "I'm gonna go get one of those job things.",
                "ross": "I'm the holiday armadillo!",
                "monica": "I'm breezy!",
                "chandler": "So it seems like this internet thing is here to stay, huh?",
                "phoebe": "Thank you, my babies.",
                "joey": "Well the fridge broke, so I had to eat everything."]
    
    var friends: [Friend] {
        for (name, info) in list {
            friendController.addFriend(name: name, information: info)
        }
        return friendController.friends
    }
}
