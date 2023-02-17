//
//  Data.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 10/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

extension Data {
  var stringUTF8: String? {
    return NSString(data: self, encoding: String.Encoding.utf8.rawValue) as String?
  }
}
