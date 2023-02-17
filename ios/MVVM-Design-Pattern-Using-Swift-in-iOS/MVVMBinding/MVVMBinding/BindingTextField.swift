//
//  BindingTextField.swift
//  MVVMBinding
//
//  Created by Paulo on 25/06/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
  var textChanged: (String) -> () = { _ in }
  
  func bind(callback: @escaping (String) -> ()) {
    textChanged = callback
    addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
  }
  
  @objc func textFieldDidChange(_ textField: UITextField) {
    textChanged(textField.text!)
  }
}
