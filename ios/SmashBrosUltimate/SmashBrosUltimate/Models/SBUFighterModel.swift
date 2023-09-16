//
//  SBUFighterModel.swift
//  SmashBrosUltimate
//
//  Created by Paulo Keller on 18/01/22.
//

import Foundation
import RealmSwift

class SBUFighterModel: Object, ObjectKeyIdentifiable, Codable {
  @Persisted var objectID: String?
  @Persisted var name: String?
  @Persisted var universe: String?
  @Persisted var price: String?
  @Persisted var popular: Bool?
  @Persisted var downloads: String?
  @Persisted var fighterDescription: String?
  @Persisted var imageURL: String?
  
  enum CodingKeys: String, CodingKey {
    case objectID
    case name
    case universe
    case price
    case popular
    case downloads
    case fighterDescription = "description"
    case imageURL
  }
}
