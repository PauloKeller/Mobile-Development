//
//  UsersListViewModel.swift
//  HelloMVVM
//
//  Created by Paulo on 25/06/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class UsersListViewModel {
  var userViewModels: [UserViewModel] = []
  private var dataAccess: DataAccess
  
  init(dataAccess: DataAccess) {
    self.dataAccess = dataAccess
    
    populateUsers()
  }
  
  private func populateUsers() {
    let users = dataAccess.getAllUsers()
    userViewModels = users.compactMap { user in
      return UserViewModel(user: user)
    }
  }
  
}

class UserViewModel {
  var firstName: String!
  var lastName: String!
  
  init(user: User) {
    self.firstName = user.firstName
    self.lastName = user.lastName
  }
}
