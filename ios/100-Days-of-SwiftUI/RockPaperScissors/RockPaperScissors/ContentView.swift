//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Paulo Keller on 11/08/21.
//

import SwiftUI

struct ContentView: View {
  let moves = ["Rock", "Paper", "Scissors"]
  let winnerTitle = "Winner"
  let loserTitle = "Loser"
  let winnerMessage = "Your beat the game!"
  let loserMessage = "You got beatted!"
  
  @State private var appSelection = Int.random(in: 0...2)
  @State private var score = 0 {
    didSet {
      if score >= 10 {
        restartGame()
      }
    }
  }
  
  @State private var isWinner = false
  @State private var shouldWin = Bool.random()
  @State private var showingScore = false
  @State private var currentMove = 0 {
    didSet {
      let appMove = moves[appSelection]
      let playerMove = moves[currentMove]
      var winnerMove = false
      
      switch appMove {
      case "Rock":
        if playerMove == "Paper" {
          winnerMove = true
        }
      case "Paper":
        if playerMove == "Scissors" {
          winnerMove = true
        }
      case "Scissors":
        if playerMove == "Rock" {
          winnerMove = true
        }
      default: break
      }
      
      if winnerMove && shouldWin || !winnerMove && !shouldWin {
        score += 1
        isWinner = true
      }
    }
  }
  
  var body: some View {
    VStack {
      VStack {
        Text("Your score is \(score)")
          .font(.largeTitle)
          .fontWeight(.black)
          .padding()
        Text("App move is \(moves[appSelection])")
        Text("The player should \(shouldWin ? "win" : "lose")")
      }
      ForEach(0 ..< 3) { number in
        Button(action: {
          moveTapped(number)
        }, label: {
          Text(moves[number]).padding()
        })
      }
    }.alert(isPresented: $showingScore, content: {
      Alert(title: Text(isWinner ? winnerTitle : loserTitle), message: Text(isWinner ? winnerMessage : loserMessage), dismissButton: .default(Text("Continue")) {
        playAgain()
      })
    })
  }
  
  private func moveTapped(_ number: Int) {
    currentMove = number
    showingScore.toggle()
  }
  
  private func playAgain() {
    appSelection = Int.random(in: 0...2)
    shouldWin = Bool.random()
    isWinner = false
  }
  
  private func restartGame() {
    score = 0
    playAgain()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
