//
//  DataAccess.swift
//  HelloMVVM
//
//  Created by Paulo on 25/06/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class DataAccess {
  func getAllUsers() -> [User] {
    var users = [User]()
    
    users.append(User(firstName: "User1", lastName: "User1", email: "user1@user1.com", password: "password"))
    users.append(User(firstName: "User2", lastName: "User2", email: "user2@user2.com", password: "password"))
    users.append(User(firstName: "User3", lastName: "User3", email: "user3@user3.com", password: "password"))
    users.append(User(firstName: "User4", lastName: "User4", email: "user4@user4.com", password: "password"))
    
    return users
  }
}
