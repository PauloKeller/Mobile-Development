//
//  SharedPreferencesManager.swift
//  SmashBrosUltimate
//
//  Created by Paulo Keller on 21/01/22.
//

import Foundation

protocol SharedPreferencesManagerProtocol {
  func getIsNotFirstTime() -> Bool
  func setIsNotFirstTime(value: Bool)
}

class SharedPreferencesManager {
  static let shared = SharedPreferencesManager()
  
  
}

extension SharedPreferencesManager: SharedPreferencesManagerProtocol {
  func getIsNotFirstTime() -> Bool {
    UserDefaults.standard.bool(forKey: "isNotFirstTime")
  }
  
  func setIsNotFirstTime(value: Bool) {
    UserDefaults.standard.set(value.self, forKey: "isNotFirstTime")
  }
}
