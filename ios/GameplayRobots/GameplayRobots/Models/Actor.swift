//
//  Actor.swift
//  GameplayRobots
//
//  Created by Paulo Keller on 29/07/23.
//

import SwiftUI

enum Actor {
  case botOne
  case botOneTrail
  case botTwo
  case botTwoTrail
  case none
  case prize
}

extension Actor {
  func getColor() -> Color {
    switch self {
    case .none:
      return .board
    case .botOne:
      return .botOne
    case .botOneTrail:
      return .botOneTrail
    case .botTwo:
      return .botTwo
    case .botTwoTrail:
      return .botTwoTrail
    case .prize:
      return .prize
    }
  }
}
