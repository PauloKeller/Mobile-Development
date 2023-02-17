//
//  UserViewModel.swift
//  MVVMBinding
//
//  Created by Mohammad Azam on 12/4/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation

class UserViewModel {
  
  var email :Dynamic<String>!
  var password :Dynamic<String>!
  
  init(email :String, password :String) {
    self.email = Dynamic<String>(email)
    self.password = Dynamic<String>(password)
  }
  
}
