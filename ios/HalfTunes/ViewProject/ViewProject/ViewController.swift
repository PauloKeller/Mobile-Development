//
//  ViewController.swift
//  ViewProject
//
//  Created by paulo on 21/09/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var featureView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
//    self.view.addSubview(featureView)
    
    guard let featureView2 = Bundle.main.loadNibNamed("Feature", owner: self, options: nil)?.first as? FeatureView else {
      return
    }
    
    self.view.addSubview(featureView2)
  }
}

