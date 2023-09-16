//
//  SBUBaseProvider.swift
//  SmashBrosUltimate
//
//  Created by Paulo Keller on 17/01/22.
//

import Foundation

public enum SBUError: Error {
  case failed
  case failedToDecode
  case invalidStatusCode
  case failedToCache
}

struct Results<Element: Decodable>: Decodable {
  let items: [Element]
}

class SBUBaseProvider {
  func request<T: Decodable>(_ dynamicType: T.Type, route: String) async throws -> T {
    guard let url = URL(string: route) else { throw SBUError.failed }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      throw SBUError.invalidStatusCode
    }
    
    guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
      throw SBUError.failedToDecode
    }
    
    return decodedData
  }
}
