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
  private var registrationViewModel: RegistrationViewModel!
  
  @IBOutlet weak var emailTextField: BindingTextField! {
    didSet {
      emailTextField.bind { self.registrationViewModel.email = $0 }
    }
  }
  
  @IBOutlet weak var passwordTextField: BindingTextField! {
    didSet {
      passwordTextField.bind { self.registrationViewModel.password = $0 }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    registrationViewModel = RegistrationViewModel()
  }
  
  @IBAction func save() {
    var message = ""
    
    if registrationViewModel.email.isEmpty {
      message += "Emais is empty!"
    }
    
    if registrationViewModel.password.isEmpty {
      message += "Password is empty"
    }
    
    let alertController = UIAlertController(title: "Errors", message: message, preferredStyle: .alert)
    let alertOKAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alertController.addAction(alertOKAction)
    
    present(alertController, animated: true, completion: nil)
    
    print(registrationViewModel.email, registrationViewModel.password)
  }
  
}
