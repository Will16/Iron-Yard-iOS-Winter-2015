//
//  GameScene.swift
//  Ship
//
//  Created by William McDuff on 2015-02-09.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var red: Bool?
    
    var purple: Bool?
    
    var blue: Bool?
    
    var fireBall: Bool?
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        
        let background = SKSpriteNode(imageNamed: "galaxy")
        
        background.size = self.size
        
        background.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame))
      
        addChild(background)

        fireBall = false
       
        red = false
        purple = false
        blue  = false
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        
        // y is positive so goes up
        self.physicsWorld.gravity = CGVectorMake(0.0, 2.0)
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let fireBallPath = NSBundle.mainBundle().pathForResource("fireBall", ofType: "sks")
            
            // taking a file and create an object out of it
            
            let fireBall = NSKeyedUnarchiver.unarchiveObjectWithFile(fireBallPath!) as SKEmitterNode
            
            fireBall.particleBirthRate = 10
            fireBall.position = location
            
            let ball = SKShapeNode(circleOfRadius: 20)
            
            ball.position = location
            
            ball.lineWidth = 7
            
            if red == false {
                if blue == false {
                    ball.fillColor = SKColor.greenColor()
                    ball.strokeColor = SKColor.yellowColor()
                    
                    var strokeColor = SKColor.yellowColor()
                    blue = true
                }
                    
                else {
                    ball.fillColor = SKColor.blueColor()
                    ball.strokeColor = SKColor.redColor()
                    blue = false
                    red = true
                }
                
            }
                
            else {
                
                if purple == false {
                    ball.fillColor = SKColor.purpleColor()
                    ball.strokeColor = SKColor.greenColor()
                    purple = true
                }
                    
                else {
                    ball.fillColor = SKColor.redColor()
                    
                    ball.strokeColor = SKColor.blueColor()
                    
                    red = false
                    purple = false
                }
                
            }

            let physicsBody = SKPhysicsBody(circleOfRadius: 20)
            ball.physicsBody = physicsBody
            
            physicsBody.affectedByGravity = false
           
              self.addChild(fireBall)
            
            /*
            if fireBall == false {
                self.fireBall = true
                self.addChild(ball)
            }
            else {
                self.fireBall = false
                self.addChild(fireBall)
            }
            
*/
            physicsBody.applyForce(CGVectorMake(500.0, 0.0))
            
        }
    

    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        /*
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let circle = SKShapeNode(circleOfRadius: 20)
            
            circle.lineWidth = 7
            // SKColor (spriteKit) or UIColor
            
            if red == false {
                if blue == false {
                    circle.fillColor = SKColor.greenColor()
                    circle.strokeColor = SKColor.yellowColor()

                    var strokeColor = SKColor.yellowColor()
                    blue = true
                }
                
                else {
                    circle.fillColor = SKColor.blueColor()
                    circle.strokeColor = SKColor.redColor()
                    blue = false
                    red = true
                }
                
            }
            
            else {
                
                if purple == false {
                    circle.fillColor = SKColor.purpleColor()
                    circle.strokeColor = SKColor.greenColor()
                    purple = true
                }
                
                else {
                    circle.fillColor = SKColor.redColor()
                  
                    circle.strokeColor = SKColor.blueColor()
              
                    red = false
                    purple = false
                }
        
            }
    
            
            circle.position = location
            
            circle.physicsBody = SKPhysicsBody(circleOfRadius: 20)
            
            self.addChild(circle)
            
            
            
           
            
            }
*/
    }
    
    
    /*
     override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
        }
    }
   */
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        for child in self.children as [SKNode]{
            if child.position.y < 0 {
              child.removeFromParent()
                
             //   child.position.y = self.frame.height + 100
            }
            
        
        }
            
        
        println(self.children)
    }
}
