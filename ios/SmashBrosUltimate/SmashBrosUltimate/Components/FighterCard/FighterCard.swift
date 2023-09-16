//
//  FighterCard.swift
//  SmashBrosUltimate
//
//  Created by Paulo Keller on 20/01/22.
//

import SwiftUI

struct FighterCard: View {
  let fighter: SBUFighterModel
  
  var body: some View {
    VStack {
      ZStack {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .fill(.white)
          .shadow(radius: 2)
        NavigationLink(destination: FighterDetailsView(fighter: fighter)) {
          AsyncImage(
            url: URL(string: fighter.imageURL ?? "")
            , content: { image in
              image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 300, maxHeight: 100)
            }, placeholder: {
              ProgressView()
            })
        }
      }
      .frame(width: 140, height: 140)
      Text(fighter.name ?? "")
      Text(fighter.universe ?? "")
    }
  }
}
