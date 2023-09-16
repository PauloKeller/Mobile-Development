//
//  UniverseFilterSelector.swift
//  SmashBrosUltimate
//
//  Created by Paulo Keller on 21/01/22.
//

import SwiftUI

struct UniverseFilterSelector: View {
  var callBack : (_ name: String) -> ()
  var names: [String]
  private let rowsGrid = [GridItem(.flexible())]

  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: rowsGrid, spacing: 20) {
        ForEach(names, id: \.self) { name in
          Button( action: { callBack(name) }) {
            Text(name)
          }
        }
      }
    }
  }
}
