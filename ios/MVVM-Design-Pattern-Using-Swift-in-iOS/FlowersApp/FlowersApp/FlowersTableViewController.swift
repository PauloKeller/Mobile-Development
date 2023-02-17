//
//  FlowersTableViewController.swift
//  FlowersApp
//
//  Created by Mohammad Azam on 12/11/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class FlowersTableViewController : UITableViewController {
  private var flowersListViewModel: FlowersListViewModel!
  private var webservice: Webservice = Webservice()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    flowersListViewModel = FlowersListViewModel(webservice: webservice, completion: {
      self.tableView.reloadData()
    })
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    flowersListViewModel.flowerViewModels.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let flower = flowersListViewModel.flowerViewModels[indexPath.row]
    cell.textLabel?.text = flower.name
    
    return cell
  }
}
