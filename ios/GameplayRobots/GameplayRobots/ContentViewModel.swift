//
//  ContentViewModel.swift
//  GameplayRobots
//
//  Created by Paulo Keller on 29/07/23.
//

import Foundation

class ContentViewModel: ObservableObject {
  typealias Position = (row: Int, column: Int)
  
  @Published private var botOneCurrentLocation = Position(0, 0)
  @Published private var botTwoCurrentLocation = Position (0, 0)
  @Published private var prizePosition = Position(0, 0)
  @Published private var currentBot = Actor.botOne
  @Published var botOneScore = 0
  @Published var botTwoScore = 0
  @Published var board = [[Actor]]()
  @Published var boardIsAvailable = false
  
  let rows = 7
  let columns = 7
  private var timer: Timer?
  
  func startGame() {
    startNewMatch()
  }
  
  private func startNewMatch() {
    board = [[Actor]]()
    botOneCurrentLocation = Position(0, 0)
    botTwoCurrentLocation = Position (0, 0)
    prizePosition = Position(0, 0)
    boardIsAvailable = false
    currentBot = Bool.random() ? .botOne : .botTwo
    
    fillBoardEmpty()
    spawnBots()
    addPrize()
    moveBots()
    
    boardIsAvailable = true
  }
  
  private func fillBoardEmpty() {
    for _ in 0..<7 {
      let row = Array(repeating: Actor.none, count: 7)
      board.append(row)
    }
  }
  
  private func moveBots() {
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
      let currentPosition = currentBot == .botOne ? botOneCurrentLocation : botTwoCurrentLocation
      let nextMove = getNextMoveForBot(currentPosition: currentPosition)
      moveBot(position: nextMove, bot: currentBot)
    }
  }
  
  private func manhattanDistance(currentPosition: Position) -> Int {
    return abs(currentPosition.row - prizePosition.row) + abs(currentPosition.column - prizePosition.column)
  }
  
  private func getNextMoveForBot(currentPosition: Position) -> Position {
    var bestDistance = Int.max
    var nextRow = currentPosition.row
    var nextColumn = currentPosition.column
    
    // Check all possible moves around the bot
    for move in [(0, 1), (1, 0), (0, -1), (-1, 0)] {
      let newRow = currentPosition.row + move.0
      let newColumn = currentPosition.column + move.1
      let currentPosition = Position(newRow, newColumn)
      let distance = manhattanDistance(currentPosition: currentPosition)
      if distance < bestDistance {
        bestDistance = distance
        nextRow = newRow
        nextColumn = newColumn
      }
    }
    
    return Position(nextRow, nextColumn)
  }
  
  private func moveBot(position: Position, bot: Actor) {
    if currentBot == .botOne {
      board[botOneCurrentLocation.row][botOneCurrentLocation.column] = .botOneTrail
      botOneCurrentLocation = position
      currentBot = .botTwo
    } else {
      board[botTwoCurrentLocation.row][botTwoCurrentLocation.column] = .botTwoTrail
      botTwoCurrentLocation = position
      currentBot = .botOne
    }
    
    switch board[position.row][position.column] {
    case .none:
      board[position.row][position.column] = bot
      
    case .prize:
      timer?.invalidate()
      board[position.row][position.column] = bot
      
      if bot == .botOne {
        botOneScore += 1
      } else {
        botTwoScore += 1
      }
      
      startNewMatch()
    default: break
    }
  }
  
  private func spawnBots() {
    board[6][0] = .botOne
    botOneCurrentLocation = Position(row: 6, column: 0)
    
    board[0][6] = .botTwo
    botTwoCurrentLocation = Position(row: 0, column: 6)
  }
  
  private func addPrize() {
    prizePosition = randomPrizePosition()
    board[prizePosition.row][prizePosition.column] = .prize
  }
  
  private func randomPrizePosition() -> Position {
    while true {
      let randomRow = Int.random(in: 0..<rows)
      let randomColumn = Int.random(in: 0..<columns)
      if (board[randomRow][randomColumn] == .none) {
        return Position(randomRow, randomColumn)
      }
    }
  }
}
