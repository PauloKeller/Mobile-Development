//
//  UsersTableViewController.swift
//  MVVMBinding
//
//  Created by Mohammad Azam on 12/4/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class UsersTableViewController : UITableViewController {
  
  private var users :[UserViewModel] = [UserViewModel]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let user1 = UserViewModel(email: "johndoe@gmail.com",password: "password")
    self.users.append(user1)
    
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.users.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let user = self.users[indexPath.row]
    cell.textLabel?.text = user.email.value
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    let indexPath = (self.tableView.indexPathForSelectedRow)!
    let user = self.users[indexPath.row]
    
    let registrationTVC = segue.destination as! RegistrationTableViewController
    registrationTVC.selectedUser = user
  }
  
}
