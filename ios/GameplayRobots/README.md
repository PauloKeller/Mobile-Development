# GameplayRobots
An automated game about bots seaking a prize on a 7x7 board.

The bots will seek a prize on a random location on the board in a endless game, each round will give a win score for the winner when the winner bot catches the prize the round will restart over and over again.

![ezgif-5-082f4a374b](https://github.com/PauloKeller/GameplayRobots/assets/21090990/23ad09f8-5b8a-4bd4-85b0-a004477f87f6)

# Rules

- At the start of each round, randomly place a prize token somewhere on the game board and start each robot at opposite corners of the board, the first bot to move will be randomized.
- Robots should take turns making legal game moves. As each move is made the robot will leave a trail of each space it has moved through during the round — these trail spaces may not be passed through by the other robot during the course of the round.
- Each robot may move either left, right, up, or down to an unoccupied and unvisited space. Diagonal moves are not allowed.
- If a robot cannot move from its current position, it should hold its position until the end of the round.
- The first robot to reach the prize wins one point, the board then resets, and the next round starts.

# Design 

The project is using swiftui and the mvvm design pattern, focusing on simplicity

## Actor

The actor is reponsible for represent the actors inside the game, bot one, bot two, prize etc.

```
enum Actor {
  case botOne
  case botOneTrail
  case botTwo
  case botTwoTrail
  case none
  case prize
}
```

## Board

The board is a array 2D with size of 7x7 based on rows and columns for the game, and it keep tracks of the actors in the game.

```
@Published var board = [[Actor]]()
```

## Position

The position tuple is used for represent the destination and how the bots interact with the board 

```
typealias Position = (row: Int, column: Int)
```

## Score

The winning score of the bots  

```
@Published var botOneScore = 0
@Published var botTwoScore = 0
```
# Search prize system 

This is the most importante part of the project it's how the bots search the prize inside of the board, basically it's use a search algorith to mesure the current position to the prize position, it's use a algorith called [Manhattan distance](https://en.wikipedia.org/wiki/Taxicab_geometry).

## Manhattan Distance

This was the first solutions that I found when I searched how to calculate a distance between two points on google this is the [stack overflow link](https://stackoverflow.com/questions/8224470/calculating-manhattan-distance).

```
private func manhattanDistance(currentPosition: Position) -> Int {
  return abs(currentPosition.row - prizePosition.row) + abs(currentPosition.column - prizePosition.column)
}
```

## Get next move

Then I need to check the possibles moves for the bot only in the vertical and horizontal cells. 

```
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
```
# Tests

I check the game start to see if we don't have missing scores or scores from other games and if when the game start its always a fresh start.
A improve for this game since it's autonomous will be integration tests.

```
  func testStartGame() {
    let sut = ContentViewModel()
    
    XCTAssertEqual(sut.board.count, 0)
    XCTAssertEqual(sut.botOneScore, 0)
    XCTAssertEqual(sut.botTwoScore, 0)
    XCTAssertFalse(sut.boardIsAvailable)
    
    sut.startGame()
    
    sleep(1)
    
    XCTAssertEqual(sut.board.count, 7)
    XCTAssertEqual(sut.botOneScore, 0)
    XCTAssertEqual(sut.botTwoScore, 0)
    XCTAssertTrue(sut.boardIsAvailable)
  }
```

  
