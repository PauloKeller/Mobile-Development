//
//  ScoreView.swift
//  GameplayRobots
//
//  Created by Paulo Keller on 29/07/23.
//

import SwiftUI

struct ScoreView: View {
  var botOneScore: Int
  var botTwoScore: Int
  
  var body: some View {
    HStack {
      HStack {
        ZStack {
          Circle()
            .fill(Actor.botOne.getColor())
        }.frame(width: 15, height: 15)
        Text("\(botOneScore)")
          .foregroundStyle(Actor.botOne.getColor())
      }
      
      Spacer()
      
      HStack {
        Text("\(botTwoScore)")
          .foregroundStyle(Actor.botTwo.getColor())
        ZStack {
          Circle()
            .fill(Actor.botTwo.getColor())
        }.frame(width: 15, height: 15)
      }
    }
  }
}
