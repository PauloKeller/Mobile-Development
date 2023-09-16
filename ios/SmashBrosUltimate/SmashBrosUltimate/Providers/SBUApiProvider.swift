//
//  SBUApiProvider.swift
//  SmashBrosUltimate
//
//  Created by Paulo Keller on 17/01/22.
//

import Foundation

protocol SBUApiProviderProtocol {
  func fetchUniverses() async throws -> [SBUUniverseModel]
  func fetchFighters(filter: String?) async throws -> [SBUFighterModel]
}

class SBUApiProvider : SBUBaseProvider {
  private static let sharedInstance = SBUApiProvider(baseURL: "https://593cdf8fb56f410011e7e7a9.mockapi.io")
  
  let baseURL: String
  
  private init(baseURL: String) {
    self.baseURL = baseURL
  }
  
  class func shared() -> SBUApiProvider {
    return sharedInstance
  }
}

extension SBUApiProvider: SBUApiProviderProtocol {
  func fetchUniverses() async throws -> [SBUUniverseModel] {
    let route = "\(baseURL)/universes"
    
    guard let response = try? await request([SBUUniverseModel].self, route: route) else {
      throw SBUError.failed
    }

    return response
  }
  
  func fetchFighters(filter: String?) async throws -> [SBUFighterModel] {
    var route = "\(baseURL)/fighters"
    
    if let filter = filter {
      route = "\(baseURL)/fighters?universe=\(filter)"
    }
    
    guard let response = try? await request([SBUFighterModel].self, route: route) else {
      throw SBUError.failed
    }
    
    return response
  }
}
