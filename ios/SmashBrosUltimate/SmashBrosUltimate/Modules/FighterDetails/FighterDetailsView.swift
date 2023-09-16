//
//  FighterDetailsView.swift
//  SmashBrosUltimate
//
//  Created by Paulo Keller on 21/01/22.
//

import SwiftUI

struct FighterDetailsView: View {
  let fighter: SBUFighterModel
  
  var body: some View {
    NavigationView {
      ScrollView {
        ZStack {
          Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 1, y: 375))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 245))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 1))
          }.fill(Color(hex: 0xDB3069))
          HStack {
            VStack(alignment: .leading) {
              Text(fighter.name ?? "")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .foregroundColor(.white)
              Text(fighter.universe ?? "")
                .font(.system(size: 20))
                .foregroundColor(.white)
              HStack {
                VStack {
                  Text("\(fighter.downloads ?? "") downloads")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                  VStack {
                    Text("$\(fighter.price ?? "")")
                      .font(.system(size: 22))
                      .fontWeight(.bold)
                      .foregroundColor(Color(hex: 0xDB3069))
                  }
                  .frame(width: 84, height: 40)
                  .background(.white)
                  .cornerRadius(6)
                  
                }
                VStack {
                  AsyncImage(
                    url: URL(string: fighter.imageURL ?? "")
                    , content: { image in
                      image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200, maxHeight: 200)
                    }, placeholder: {
                      ProgressView()
                    })
                }
              }
              HStack {
                VStack {
                  Text(fighter.fighterDescription ?? "")
                }
              }
            }
          }
        }
      }
    }
  }
}

struct FighterDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    FighterDetailsView(fighter: SBUFighterModel())
  }
}

