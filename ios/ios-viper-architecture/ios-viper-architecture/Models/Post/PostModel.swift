//
//  PostsModel.swift
//  ios-viper-architecture
//
//  Created by Paulo Vinicius  de Souza Keller on 16/04/21.
//  Copyright © 2021 Paulo Vinicius  de Souza Keller. All rights reserved.
//

import Foundation

struct PostModel: Decodable {
  
  // MARK: Properties
  var userId: Int64 = -1
  var id: Int64 = -1
  var title: String = ""
  var body: String = ""
  
  // MARK: Keys
  private enum CodingKeys: CodingKey {
    case userId
    case id
    case title
    case body
  }
  
  init (userId: Int64, id: Int64, title: String, body: String) {
    self.userId = userId
    self.id = id
    self.title = title
    self.body = body
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    userId = try container.decodeIfPresent(Int64.self, forKey: .userId) ?? -1
    id = try container.decodeIfPresent(Int64.self, forKey: .id) ?? -1
    title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
    body = try container.decodeIfPresent(String.self, forKey: .body) ?? ""
  }
}
