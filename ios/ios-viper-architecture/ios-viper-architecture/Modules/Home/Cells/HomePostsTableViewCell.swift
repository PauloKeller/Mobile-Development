//
//  HomePostsTableViewCell.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 17/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import UIKit

class HomePostsTableViewCell: UITableViewCell {
  
  // MARK: - IBOutlets
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var bodyLabel: UILabel!
  
  // MARK: - Public properties
  
  static let id = "HomePostsTableViewCell"
  
  // MARK: - Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  
  func setupProperties(title: String?, body: String?) {
    titleLabel.text = title
    bodyLabel.text = body
  }
  // MARK: - UIActions
}
