//
//  BoardView.swift
//  Archive
//
//  Created by William McDuff on 2015-02-26.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    
    // if we don't initialize we need the required init (because we do stuff in the storyboard)
    var dots: [Dot] = []


    var color = UIColor.grayColor()
    
    var diameter = 1
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override func drawRect(rect: CGRect) {
        // Drawing Code
        
        var context = UIGraphicsGetCurrentContext()
        for dot in dots {
            
            CGContextSetLineCap(context, kCGLineCapRound)
            
            CGContextSetLineWidth(context, dot.diameter)
            
            dot.color.set()
            
            CGContextMoveToPoint(context, dot.center.x, dot.center.y)
            
            CGContextAddLineToPoint(context, dot.center.x, dot.center.y)
            
            CGContextStrokePath(context)
            
        }
        
    }
  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    
    
    
    
        addDot(touches)
    }
    
    override func touchesMoved(touches:NSSet, withEvent event: UIEvent) {
        
        addDot(touches)
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        NSNotificationCenter.defaultCenter().postNotificationName("appIsClosing", object: nil, userInfo: nil)
    }
    
    func addDot(touches: NSSet) {
        
        if let touch = touches.allObjects.last as? UITouch {
            let location = touch.locationInView(self)
            
            let dot = Dot(center: location, diameter: 5)
            
            dot.color = UIColor.magentaColor()
            dots.append(dot)
            
            setNeedsDisplay()
            
        }
    }
}
