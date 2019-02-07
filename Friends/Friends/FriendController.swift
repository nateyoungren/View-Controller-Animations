//
//  FriendController.swift
//  Friends
//
//  Created by Nathanael Youngren on 2/7/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import Foundation

class FriendController {
    
    var friends: [Friend] = []
    
    func addFriends(list: [String: String]) {
        for (name, info) in list {
            let newFriend = Friend(name: name, information: info)
            friends.append(newFriend)
        }
    }
}
