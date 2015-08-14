//
//  firstCustomSegue.swift
//  MonkeyPinch
//
//  Created by William McDuff on 2015-06-22.
//  Copyright (c) 2015 Caroline Begbie. All rights reserved.
//

import UIKit

class firstCustomSegue: UIStoryboardSegue {
   
    // create a segue in the storybord from a VC to another VC
    // create a cocoa touch class called firstCustomSegue that is a subclass of UIStoryboardSegue
    // click on the segue in the storyboard, and in the identity inspector make it's class to be of firstCustomSegue and it's identifier to be firstCustomSegue
    // in the firstCustomSegue class override the perform method of the UIStoryboardSegue parent class
    override func perform() {
        // Assign the source and destination views to local variables.
        var firstVCView = self.sourceViewController.view as UIView!
        var secondVCView = self.destinationViewController.view as UIView!
        
        // Get the screen width and height.
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        // Specify the initial position of the destination view.
        secondVCView.frame = CGRectMake(0.0, -screenHeight, screenWidth, screenHeight)
        
        // Access the app's key window and insert the destination view above the current (source) one.
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)
        
        // Animate the transition.
        UIView.animateWithDuration(0.4, animations: { () -> Void in

            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, screenHeight)
            
            }) { (Bool) -> Void in
                
                
                self.sourceViewController.presentViewController(self.destinationViewController as! SecondVC,
                    animated: false,
                    completion: nil)
        }
        
    }
    
}
