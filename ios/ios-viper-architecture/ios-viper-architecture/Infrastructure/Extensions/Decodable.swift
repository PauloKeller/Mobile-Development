//
//  Decodable.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 10/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

extension Decodable {
  static func parse(jsonFile: String) -> Self? {
    guard let url = Bundle.main.url(forResource: jsonFile, withExtension: "json"),
      let data = try? Data(contentsOf: url),
      let output = try? JSONDecoder().decode(self, from: data)
      else {
        return nil
    }
    
    return output
  }
  
  static func parse(dic: [String: Any]) -> Self? {
    do {
      let jsonData = try JSONSerialization.data(withJSONObject: dic, options: [])
      let result = try JSONDecoder().decode(self, from: jsonData)
      return result
    } catch {
      return nil
    }
  }
  
  static func parse(data: Data) -> Self? {
    do {
      let result = try JSONDecoder().decode(self, from: data)
      return result
    } catch {
      return nil
    }
  }
  
  static func parse(textData: String) -> Self? {
    do {
      guard let jsonData = textData.data(using: String.Encoding.utf8, allowLossyConversion: false) else { return nil }
      let result = try JSONDecoder().decode(self, from: jsonData)
      return result
    } catch {
      return nil
    }
  }
}
