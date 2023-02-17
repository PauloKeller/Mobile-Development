//
//  AuthenticationModel.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 10/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

struct AuthenticationModel: Decodable {
  
  // MARK: Properties
  var jwt: String = ""
  var accessToken: String = ""
  
  // MARK: Keys
  private enum CodingKeys: CodingKey {
    case jwt
    case accessToken
  }
  
  init (jwt: String, accessToken: String) {
    self.jwt = jwt
    self.accessToken = accessToken
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    jwt = try container.decodeIfPresent(String.self, forKey: .jwt) ?? ""
    accessToken = try container.decodeIfPresent(String.self, forKey: .accessToken) ?? ""
  }
}
