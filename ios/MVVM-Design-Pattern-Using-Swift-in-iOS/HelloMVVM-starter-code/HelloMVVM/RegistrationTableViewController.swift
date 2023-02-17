//
//  RegistrationTableViewController.swift
//  HelloMVVM
//
//  Created by Mohammad Azam on 11/26/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class RegistrationTableViewController : UITableViewController {
  
  @IBOutlet weak var firstNameTextField :UITextField!
  @IBOutlet weak var lastnameTextField :UITextField!
  @IBOutlet weak var emailTextField :UITextField!
  @IBOutlet weak var passwordTextField :UITextField!
  
  private var registrationViewModel: RegistrationViewModel!
  var selectedUserViewModel: UserViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    firstNameTextField.text = selectedUserViewModel.firstName
    lastnameTextField.text = selectedUserViewModel.lastName
  }
  
  @IBAction func save() {
    registrationViewModel = RegistrationViewModel(firstName: firstNameTextField.text!, lastName: lastnameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)
    
    registrationViewModel.save()
  }
}
