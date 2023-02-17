//
//  RouterNameProtocol.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 10/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

protocol Routerable {
  var endpoint: String { get }
  var path: String { get }
}

extension Routerable {
  
  var endpoint: String {
    return prefix + path
  }
  
  private var prefix: String {
    switch self {
    case is RouterAuthentication:
      return makePrefix(withKey: .authentication)
    case is RouterJsonPlaceHolder:
      return makePrefix(withKey: .jsonplaceholder)
    default:
      fatalError("You need to provide a Routerable implementation")
    }
  }

  func makePrefix(withKey key: Environment.KeyValue) -> String {
    guard let prefix = Environment.value(for: key) as? String else {
      fatalError("Couldn't find key: \(key)")
    }
    return prefix
  }
}

protocol RouterAuthentication: Routerable {
  
}

protocol RouterJsonPlaceHolder: Routerable {
  
}
