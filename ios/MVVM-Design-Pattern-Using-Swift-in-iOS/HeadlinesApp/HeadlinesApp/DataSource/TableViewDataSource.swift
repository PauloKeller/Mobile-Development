//
//  TableViewDataSource.swift
//  HeadlinesApp
//
//  Created by Paulo on 29/06/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<Cell: UITableViewCell, ViewModel>: NSObject, UITableViewDataSource {
  private var cellIdentifier: String!
  private var items: [ViewModel]!
  var configureCell: (Cell, ViewModel) -> ()
  
  init(cellIdentifier: String, items: [ViewModel], configureCell: @escaping (Cell, ViewModel) -> ()) {
    self.cellIdentifier = cellIdentifier
    self.items = items
    self.configureCell = configureCell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! Cell
    let item = items[indexPath.row]
    configureCell(cell, item)
    return cell
  }
}
