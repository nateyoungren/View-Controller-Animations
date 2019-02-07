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
    
    func addFriend(name: String, information: String) {
        let newFriend = Friend(name: name, imageName: name, information: information)
        friends.append(newFriend)
    }
    
}
