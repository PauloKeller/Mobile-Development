//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Paulo Keller on 09/08/21.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
  func titleStyle() -> some View {
    self.modifier(Title())
  }
}

struct ContentView: View {
  var body: some View {
    Text("Hello World")
      .titleStyle()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
