//
//  HomeViewController.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 17/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var postsTableView: UITableView!
  
  // MARK: - Class properties
  
  // MARK: - Public properties
  
  var presenter: HomePresenter!
  
  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewConfiguration()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    fetchData()
  }
  
  // MARK: - Class Configurations

  private func viewConfiguration() {
    title = presenter?.navTitle
    
    tableViewConfiguration()
  }
  
  private func tableViewConfiguration() {
    postsTableView.register(UINib(nibName: HomePostsTableViewCell.id, bundle: nil), forCellReuseIdentifier: HomePostsTableViewCell.id)
    
    postsTableView.delegate = self
    postsTableView.dataSource = self
    postsTableView.rowHeight = UITableView.automaticDimension
    postsTableView.sizeToFit()
  }
  
  private func fetchData() {
    presenter?.loadData()
  }
}

// MARK: - Extensions

extension HomeViewController: HomeViewInterface {
  func reloadTableView() {
    postsTableView.reloadData()
  }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.tableView(tableView, numberOfRowsInSection: section)
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return presenter.tableView(tableView, cellForRowAt: indexPath)
  }
  
  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.tableView(tableView, didSelectRowAt: indexPath)
  }
  
  public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return presenter.tableView(tableView, heightForRowAt: indexPath)
  }
}
