//
//  NetworkManager.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 03/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

class NetworkManager {

  private let manager = NetworkReachabilityManager(host: "m.google.com")

  static let shared: NetworkManager = {
    let instance = NetworkManager()
    return instance
  }()

  func isInternetAvailable() -> Bool {
    guard let manager = self.manager else { return false }
    return manager.isReachable
  }

  func listener(_ callback: @escaping (NetworkingStatus) -> Void) {
    manager?.listener = { status in
      callback(status)
    }
  }

  func setupReachability() {
    manager?.startListening()
  }
}
