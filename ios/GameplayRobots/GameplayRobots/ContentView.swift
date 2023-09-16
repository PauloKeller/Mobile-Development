//
//  ContentView.swift
//  GameplayRobots
//
//  Created by Paulo Keller on 28/07/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var viewModel = ContentViewModel()
  
  var body: some View {
    VStack {
      VStack {
        ScoreView(botOneScore: viewModel.botOneScore, botTwoScore: viewModel.botTwoScore)
        if viewModel.boardIsAvailable {
          ForEach(0..<viewModel.rows, id: \.self) { row in
            HStack(spacing: 0) {
              ForEach(0..<viewModel.columns, id: \.self) { col in
                CellView(actor: viewModel.board[row][col])
                  .padding(2)
              }
            }
          }
        }
      }.frame(width: 300)
    
    }.onAppear(perform: viewModel.startGame)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
