//
//  DetailsViewController.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 06/05/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

  // MARK: - Outlets
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  
  // MARK: - Class properties
  
  // MARK: - Public properties
  
  var presenter: DetailsPresenter!
  
  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewConfiguration()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  // MARK: - Class Configurations

  private func viewConfiguration() {
    title = presenter?.navTitle
    titleLabel.text = presenter.post.title
    subtitleLabel.text = presenter.post.body
  }
}

extension DetailsViewController: DetailsViewInterface {}
