//
//  GameBoardView.swift
//  GameBoard
//
//  Created by William McDuff on 2015-02-18.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

import UIKit

enum PlayerType {
    
    case Empty
    case Player1
    case Player2
    
    
}

/// 0 = empty, 1 = player1, 2 = player2

// IN OUR BROJECT NOT BOARDSQUARES IN GLOBAL

// toCall boardSquares[row][col]


let boardSquares = [
  
    [0, 1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1, 0],
    [0, 1, 0, 1, 0, 1, 0, 1],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [2, 0, 2, 0, 2, 0, 2, 0],
    [0, 2, 0, 2, 0, 2, 0, 2],
    [2, 0, 2, 0, 2, 0, 2, 0]

]


var boardPieces: [[GamePiece?]] = Array(count: 8, repeatedValue: Array(count: 8, repeatedValue: nil))


// var square = boardSquares[0][0]

@IBDesignable class GameBoardView: UIView {

    
    let gridSize = 8
    
    
    // nib is the frame of the VC (the entity that is holding the view and everything)
    override func layoutSubviews() {
        
        for (rowIndex, rowArray) in enumerate(boardSquares) {
            
            
            for (columnIndex, squarePieceType) in enumerate(rowArray) {
                
                println(squarePieceType)
                
                if squarePieceType == 0 { continue }
                
                if let type = PieceType(rawValue: squarePieceType) {
                    
                    var piece = GamePiece(type: type)
                    
                    
                    boardPieces[rowIndex][columnIndex] = piece
                    
                    let cF = CGFloat(columnIndex)
                    let rF = CGFloat(rowIndex)
                    
                    let squareSize = frame.width / CGFloat(gridSize)
                    
                    let x = cF * squareSize + squareSize/2
                    let y = rF * squareSize + squareSize/2

                    
                    piece.center = CGPointMake(x, y)
                    //piece.frame = CGRectMake(0, 0, 20, 20)
                    
                    
                    addSubview(piece)
                
                }
                
                
           
             //   var piece = GamePiece(type: PieceType.Empty)
                
            }
        }
        
    }
    
    // gridSize has to be an int for the loop, but it has to be a float for the drawing
    override func drawRect(rect: CGRect) {
        //
        
        var context = UIGraphicsGetCurrentContext()
        
        for c in 0..<gridSize {
            
            for r in 0..<gridSize {
                
                let cF = CGFloat(c)
                let rF = CGFloat(r)
                
                let squareSize = rect.width / CGFloat(gridSize)
                
                let x = cF * squareSize
                let y = rF * squareSize
                
                let blueColor = UIColor.blueColor()
             
                let color = (c + r) % 2 == 0 ? UIColor.magentaColor() : UIColor.darkGrayColor()
                
            
                
                color.set()
                CGContextFillRect(context, CGRectMake(x, y, squareSize, squareSize))
                
                
            }
            
            
            
        }
        
        
    }

    

}
