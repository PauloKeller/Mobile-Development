//
//  PresenterInterface.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 02/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

protocol PresenterInterface: class {
  func viewDidLoad()
  func viewWillAppear(animated: Bool)
  func viewDidAppear(animated: Bool)
  func viewWillDisappear(animated: Bool)
  func viewDidDisappear(animated: Bool)
}

extension PresenterInterface {
  func viewDidLoad() {
    fatalError("Implementation pending...")
  }
  
  func viewWillAppear(animated: Bool) {
    fatalError("Implementation pending...")
  }
  
  func viewDidAppear(animated: Bool) {
    fatalError("Implementation pending...")
  }
  
  func viewWillDisappear(animated: Bool) {
    fatalError("Implementation pending...")
  }
  
  func viewDidDisappear(animated: Bool) {
    fatalError("Implementation pending...")
  }
}

