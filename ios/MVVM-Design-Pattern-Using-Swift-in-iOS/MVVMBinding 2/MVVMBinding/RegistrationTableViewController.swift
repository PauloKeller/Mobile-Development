//
//  RegistrationTableViewController.swift
//  MVVMBinding
//
//  Created by Mohammad Azam on 12/4/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class RegistrationTableViewController : UITableViewController {
  
  private var registrationViewModel :RegistrationViewModel!
  
  var selectedUser :UserViewModel!
  
  @IBOutlet weak var emailTextField :BindingTextField! {
    didSet {
      emailTextField.bind { self.registrationViewModel.email = $0 }
    }
  }
  
  @IBOutlet weak var passwordTextField :BindingTextField! {
    didSet {
      passwordTextField.bind { self.registrationViewModel.password = $0 }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.registrationViewModel = RegistrationViewModel()
    
    self.selectedUser.email.bind { self.emailTextField.text = $0 }
    self.selectedUser.password.bind { self.passwordTextField.text = $0 }
  }
  
  @IBAction func save() {
    self.selectedUser.email.value = "Mary"
    self.selectedUser.password.value = "marypassword"
    
    if (registrationViewModel.isValid) {
      print("its ok!")
    } else {
      print(registrationViewModel.brokenRules)
    }
    
  }
  
}
