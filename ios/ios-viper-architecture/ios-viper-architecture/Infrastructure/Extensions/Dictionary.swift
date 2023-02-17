//
//  Dictionary.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 16/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

extension Dictionary {
  var prettyPrintedJSON: String? {
    
    guard let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) else {
      return nil
    }
    
    return String(data: data, encoding: .utf8)
  }
}
