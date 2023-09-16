//
//  SBUUniverseModel.swift
//  SmashBrosUltimate
//
//  Created by Paulo Keller on 17/01/22.
//

import Foundation
import RealmSwift

class SBUUniverseModel: Object, ObjectKeyIdentifiable, Codable {
  @Persisted var objectID: String?
  @Persisted var name: String?
  @Persisted var universeDescription: String?
  
  enum CodingKeys: String, CodingKey {
    case name
    case objectID
    case universeDescription = "description"
  }
}
