//
//  HeadlinesTableViewController.swift
//  HeadlinesApp
//
//  Created by Mohammad Azam on 12/16/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class HeadlinesTableViewController : UITableViewController {
  private var headlineListViewModel: HeadlineListViewModel!
  private var dataSource: TableViewDataSource<HeadlineTableViewCell, HeadlineViewModel>!
  var source :SourceViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateUI()
  }
  
  private func updateUI() {
    
    self.title = self.source.name
    
    headlineListViewModel = HeadlineListViewModel(sourceViewModel: source, completion: {
      self.dataSource = TableViewDataSource(cellIdentifier: "Cell", items: self.headlineListViewModel.headlineViewModels, configureCell: { cell, vm in
        cell.titleLabel.text = vm.title
        cell.descriptionLabel.text = vm.description
      })
      
      self.tableView.dataSource = self.dataSource
      self.tableView.reloadData()
    })
    
  }
}
