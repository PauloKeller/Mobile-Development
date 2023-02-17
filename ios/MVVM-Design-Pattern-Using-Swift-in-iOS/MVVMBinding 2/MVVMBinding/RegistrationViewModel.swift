//
//  RegistrationViewModel.swift
//  MVVMBinding
//
//  Created by Mohammad Azam on 12/4/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation

class Dynamic<T> {
  
  typealias Listener = (T) -> Void
  var listener :Listener?
  
  func bind(listener :Listener?) {
    self.listener = listener
    listener?(value!)
  }
  
  var value :T? {
    didSet {
      listener?(value!)
    }
  }
  
  init(_ v:T) {
    value = v
  }
  
}

struct BrokenRule {
  var propertyName: String
  var message: String
}

protocol ViewModel {
  var brokenRules : [BrokenRule] { get set }
  var isValid: Bool { mutating get }
}

class RegistrationViewModel {
  var brokenRules: [BrokenRule] = []
  var email :String! = ""
  var password :String! = ""
  
  var isValid: Bool {
    get {
      brokenRules = []
      validate()
      return brokenRules.count == 0 ? true : false
    }
  }
}

extension RegistrationViewModel {
  private func validate() {
    if email.isEmpty {
      brokenRules.append(BrokenRule(propertyName: "email", message: "email is required"))
    }
    
    if password.isEmpty {
      brokenRules.append(BrokenRule(propertyName: "password", message: "password is required"))
    }
  }
}
