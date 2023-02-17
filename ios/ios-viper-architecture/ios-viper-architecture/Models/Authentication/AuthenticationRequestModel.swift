//
//  AuthenticationRequestModel.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 10/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

import UIKit

struct AuthenticationRequestModel: Encodable {
  
  // MARK: Properties
  var login: String = ""
  var password: String = ""
  
  // MARK: Keys
  private enum CodingKeys: CodingKey {
    case login
    case password
  }
  
  init (login: String, password: String) {
    self.login = login
    self.password = password
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    login = try container.decodeIfPresent(String.self, forKey: .login) ?? ""
    password = try container.decodeIfPresent(String.self, forKey: .password) ?? ""
  }
}
