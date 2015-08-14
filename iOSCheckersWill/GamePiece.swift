//
//  GamePiece.swift
//  GameBoard
//
//  Created by William McDuff on 2015-02-18.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

import UIKit

enum PieceType: Int {
    
    case Empty
    case Player1
    case Player2
    
    
    case Player1King
    case Player2King
    
    
    
}


class GamePiece: UIView {

    
    
    var type: PieceType!
    
    
    // IF WE OVERRIDE THE INIT AND OUR CLASS IS RELATED TO THE STORYBOARD (BUTTON, UIVIEW) WE HAVE TO IMPLEMENT THE REQUIRED INIT
    
    // EVERYTIME WE IMPLEMENT SOMETHING THAT INHERITS WITH UIVIEW WE NEED TO INITWITHFRAME
    init(type: PieceType) {
        
        super.init(frame: CGRectMake(0, 0, 20, 20))
        self.type = type
        
        // hashValue gives you 0, 1, 2, 3, 4
        // if our enum is of type: Int, String we can call rawValue (in the case of string would return a string), otherwise we call hashValue (we can still call hashValue)
        backgroundColor = type.hashValue % 2 == 0 ? UIColor.cyanColor() : UIColor.yellowColor()
        
        layer.cornerRadius = 10
    }

    
    // this inits the UIView on the storyboard
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
