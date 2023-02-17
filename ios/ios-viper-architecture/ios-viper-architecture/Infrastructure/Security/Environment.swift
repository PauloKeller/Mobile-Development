//
//  Environment.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 10/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

struct FeatureFlag {
  static let isFaceIdEnable: Bool = boolValue(for: .isFaceIdEnable)
  
  /// Returns a boolean value for a given key specified on the plist file for that environment
  ///
  /// - Parameter key: Plist key that contains the configuration for the current environment
  /// - Returns: Boolean representative of that key
  private static func boolValue(for key: Environment.KeyValue) -> Bool {
    guard let enabled = Environment.value(for: key) as? Bool else {
      return false
    }
    return enabled
  }
}

class Environment {

  enum KeyValue: String {
    case authentication
    case isFaceIdEnable
    case jsonplaceholder
  }

  class func value(for key: KeyValue) -> Any {
    if let dictionary = Bundle.main.infoDictionary, let endpoint = dictionary[key.rawValue] {
      return endpoint
    } else {
      fatalError("Couldn't find \(key.rawValue)")
    }
  }
}
