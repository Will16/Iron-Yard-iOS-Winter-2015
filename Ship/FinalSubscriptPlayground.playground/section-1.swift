import Foundation
enum PlayerColor:String {
  
  case None = "-"
  case Red = "r"
  case Black = "b"
  
  var description: String {
    get {
      switch self {
      case .None:
        return "None\n"
      case .Red:
        return "Red\n"
      case .Black:
        return "Black\n"
      }
    }
  }
}


class GameBoard {
  var board: [[PlayerColor]] = []
  
  func empty() -> PlayerColor {
    return .None
  }
  func red() -> PlayerColor {
    return .Red
  }
  func black() -> PlayerColor {
    return .Black
  }
  
  init() {
    
    //Initialize the board with the standard checkers setup
    
    // 8 by 8
    board = [
      [empty(),red(),empty(),red(),empty(),red(),empty(),red()],
      [red(),empty(),red(),empty(),red(),empty(),red(),empty()],
      [empty(),red(),empty(),red(),empty(),red(),empty(),red()],
      [empty(),empty(),empty(),empty(),empty(),empty(),empty(),empty()],
      [empty(),empty(),empty(),empty(),empty(),empty(),empty(),empty()],
      [black(),empty(),black(),empty(),black(),empty(),black(),empty()],
      [empty(),black(),empty(),black(),empty(),black(),empty(),black()],
      [black(),empty(),black(),empty(),black(),empty(),black(),empty()]
    ]
  }
  
  func displayBoard() {
    var outputString = ""
    for column in board {
      for piece in column {
        outputString += piece.rawValue
      }
      outputString += "\n"
    }
    outputString += "-------------------------------\n"
    println(outputString)
  }
  
  func movePieceFrom(from: (Int,Int), to: (Int,Int)) {
    func error(errorType:String) {
      println("Invalid Move: \(errorType)")
    }
    
    // if the first, second from and the first second to are not between 0 and 7 return
    if !(0...7 ~= from.0 && 0...7 ~= from.1 && 0...7 ~= to.0 && 0...7 ~= to.1) {
      error("Range error")
      return
    }
    
    // if playerAtLocation
    if playerAtLocation(from) == .None {
      error("No Piece to Move")
      return
    }
    if playerAtLocation(to) != .None {
      error("Move onto occupied square")
      return
    }
    
    let yDifference = to.1 - from.1
    
    // EACH COLOR CAN ONLY GO ONE WAY
    
    
    // player red then ydifference (columns) is not abs(ydifference) (IS POSITIVE) or black is not abs difference (IS NEGATIVE): error wrong direction
    
    // if a player goes in wrong difference (if it doesn't equal has the absolutance distance or if it does equal to absolute distance
    
    
    
    if (playerAtLocation(from) == .Red) ? yDifference != abs(yDifference) : yDifference == abs(yDifference) {
      error("Move in wrong direction")
      return
    }

    
    
    


    
    // diagonals require that the both x and y must be one
    // and
    // if not standrad move
    if abs(to.0 - from.0) != 1 || abs(to.1 - from.1) != 1 {
        // if not hump move
      if abs(to.0 - from.0) != 2 || abs(to.1 - from.1) != 2 {
        error("Not a diagonal move")
        return
      }
        
      let coordsOfJumpedPiece = ((to.0 + from.0) / 2 as Int, (to.1 + from.1) / 2 as Int)
      let pieceToBeJumped: PlayerColor = self.playerAtLocation(coordsOfJumpedPiece)
        
         // pieceToBeJumped is equal to none or to the player doing the move: illegal
      if contains([.None, playerAtLocation(from)], pieceToBeJumped) {
        error("Illegal jump")
        return
      }
        // else (because of return) delete the piece that is jumped
      setPlayer(.None, atLocation: coordsOfJumpedPiece)    
    }
    // move the piece
    let pieceToMove = board[from.1][from.0]
    board[from.1][from.0] = empty()
    board[to.1][to.0] = pieceToMove
  }
  
  func playerAtLocation(coordinates: (Int, Int)) -> PlayerColor {
    return board[coordinates.1][coordinates.0]
  }
  
    
   
 
    
  func setPlayer(player: PlayerColor, atLocation coordinates: (Int, Int)) {
    board[coordinates.1][coordinates.0] = player
  }
  
  subscript(coordinates: (Int,Int)) -> PlayerColor {
    get {
      return playerAtLocation(coordinates)
    }
    set {
      setPlayer(newValue, atLocation: coordinates)
    }
  }

  subscript (move coordinates: (Int,Int)) -> (Int,Int) {
    get {
      assert(false, "Using the getter of this subscript is not supported.")
    }
    set {
      movePieceFrom(coordinates, to: newValue)
    }
  }
	
}


let board = GameBoard()
board.displayBoard()

board.movePieceFrom((2,5), to: (3,4))
board.displayBoard()

// subscript get: return the color
let player = board[(3,4)]
println(player.description)

// subscript set board
board[(3,4)] = .Red
board.displayBoard()

board[move:(4,5)] = (2,3)
board.displayBoard()

board[move:(1,6)] = (2,5) //legal move
board.displayBoard()

board[move:(1,6)] = (1,5) //No piece to move since
board.displayBoard() //you just moved the piece at (1,6)

board[move:(7,2)] = (6,1) //(6,1) is already occupied
board.displayBoard()

board[move:(7,2)] = (5,4) //Illegal jump - no piece to jump
board.displayBoard()

board[move:(7,2)] = (8,1) //Range Error
board.displayBoard()
 
board[move:(0,7)] = (1,6) //legal move
board.displayBoard()
