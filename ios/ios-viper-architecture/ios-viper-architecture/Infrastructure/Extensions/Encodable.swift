//
//  Encodable.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 14/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

extension Encodable {
  func convertToDictionary() -> [String: Any]? {
    do {
      let encoded = try JSONEncoder().encode(self)
      let paramDictionary = try JSONSerialization.jsonObject(with: encoded, options: []) as? [String: Any]
      return paramDictionary
    } catch {
      return nil
    }
  }
}
