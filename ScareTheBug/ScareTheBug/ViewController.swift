//
//  ViewController.swift
//  ScareTheBug
//
//  Created by William McDuff on 2015-01-27.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bedBugImageView: UIImageView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bedBugImageView.frame.origin.x  = self.view.frame.width/2
        
    
        var leafAnimation: CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "position")

        leafAnimation.duration = 10.0;
        leafAnimation.path = CGPathCreateMutable()
        self.bedBugImageView.layer.addAnimation(leafAnimation, forKey: "leafAnimation")
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let location = touches.anyObject()?.locationInView(self.view)
        if location!.x > 0 && location!.x < (self.view.frame.width - self.bedBugImageView.frame.width){
            
            UIView.animateWithDuration(2, animations: {
                self.bedBugImageView.frame.origin.x = location!.x
             
                
                
            })
            
        }
 
        
       
        if location!.y > 0 && location!.y < (self.view.frame.height - self.bedBugImageView.frame.width){
            
            UIView.animateWithDuration(2, animations: {
                self.bedBugImageView.frame.origin.y = location!.y
                
                
                
                
            })
            
        }
    }
    


    
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        let location = touches.anyObject()?.locationInView(self.view)
        if location!.x > 0 && location!.x < (self.view.frame.width - self.bedBugImageView.frame.width){
            
            UIView.animateWithDuration(2, animations: {
                self.bedBugImageView.frame.origin.x = location!.x
                
                
                
                
            })
            
        }
        if location!.y > 0 && location!.y < (self.view.frame.height - self.bedBugImageView.frame.width){
            
            UIView.animateWithDuration(2, animations: {
                self.bedBugImageView.frame.origin.y = location!.y
               
                
                
                
            })
            
        }
        

    }


}

