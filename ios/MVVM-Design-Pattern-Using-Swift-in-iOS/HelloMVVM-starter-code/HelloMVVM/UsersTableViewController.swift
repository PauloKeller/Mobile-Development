//
//  UsersTableViewController.swift
//  HelloMVVM
//
//  Created by Paulo on 25/06/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class UsersTableViewController: UITableViewController {
  private var usersListViewModel: UsersListViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    usersListViewModel = UsersListViewModel(dataAccess: DataAccess())
    tableView.reloadData()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return usersListViewModel.userViewModels.count
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let indexPath = tableView.indexPathForSelectedRow!
    
    let registrationTVC = segue.destination as! RegistrationTableViewController
    let userViewModel = usersListViewModel.userViewModels[indexPath.row]
    registrationTVC.selectedUserViewModel = userViewModel
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    let userViewModel = usersListViewModel.userViewModels[indexPath.row]
    cell.textLabel?.text = "\(userViewModel.firstName!), \(userViewModel.lastName!)"
    
    return cell
  }
}
