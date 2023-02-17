//
//  CharacterServiceResult.swift
//  Async
//
//  Created by Paulo Keller on 07/12/21.
//

import Foundation

struct CharacterServiceResult: Codable {
  let results: [Character]
}

struct Character: Codable {
  let id: Int
  let name: String
}
