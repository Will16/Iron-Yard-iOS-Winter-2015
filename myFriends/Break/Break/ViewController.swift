//
//  ViewController.swift
//  Break
//
//  Created by User on 1/28/15.
//  Copyright (c) 2015 Greg Pachman. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var gameView: UIView!
   
    var animator: UIDynamicAnimator?
    
    var gravityBehavior = UIGravityBehavior()
    
    var collisionBehavior = UICollisionBehavior()
    
    var ballBehavior = UIDynamicItemBehavior()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: gameView)
        //animator?.addBehavior(gravityBehavior)
        animator?.addBehavior(collisionBehavior)
        animator?.addBehavior(ballBehavior)
        
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        
        
        ballBehavior.friction = 0
        ballBehavior.elasticity = 1
        ballBehavior.resistance = 0
        ballBehavior.allowsRotation = false
        
        createBall()
        
    }

    func createBall() {
        
        var ball = UIView(frame: CGRectMake(0, 0, 20, 20))
        ball.center = gameView.center
        ball.backgroundColor = UIColor.blackColor()
        ball.layer.cornerRadius = 10
        
        gameView.addSubview(ball)
        gravityBehavior.addItem(ball)
        collisionBehavior.addItem(ball)
        ballBehavior.addItem(ball)
        
        var pushBehavior = UIPushBehavior(items: [ball], mode: .Instantaneous)
        
        pushBehavior.pushDirection = CGVectorMake(0.06, -0.06)
        
        animator?.addBehavior(pushBehavior)

        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

