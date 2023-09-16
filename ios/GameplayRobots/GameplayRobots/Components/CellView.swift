//
//  CellView.swift
//  GameplayRobots
//
//  Created by Paulo Keller on 29/07/23.
//

import Foundation
import SwiftUI

struct CellView: View {
  let actor: Actor
  
  var body: some View {
    Circle()
      .fill(actor.getColor())
  }
}
