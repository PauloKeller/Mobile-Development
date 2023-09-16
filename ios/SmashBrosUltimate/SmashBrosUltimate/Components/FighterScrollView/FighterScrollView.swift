//
//  FighterScrollView.swift
//  SmashBrosUltimate
//
//  Created by Paulo Keller on 20/01/22.
//

import SwiftUI

struct FightersScrollView: View {
  var data: [SBUFighterModel]
  private let towColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
  
  var body: some View{
    ScrollView {
      LazyVGrid(columns: towColumnGrid, spacing: 20) {
        ForEach(data, id: \.self) { item in
          FighterCard(fighter: item)
        }
      }.padding(.top, 30)
    }
  }
}
