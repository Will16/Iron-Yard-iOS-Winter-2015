//
//  ViewController.swift
//  MonkeyPinch
//
//  Created by Caroline Begbie on 16/04/2015.
//  Copyright (c) 2015 Caroline Begbie. All rights reserved.
//

import UIKit
import AVFoundation

extension String {
    subscript (i: Int) -> String {
        return String(Array(self)[i])
    }
}

class ViewController: UIViewController, UIGestureRecognizerDelegate {
  @IBOutlet var monkeyPan: UIPanGestureRecognizer!
  @IBOutlet var bananaPan: UIPanGestureRecognizer!
  
  var chompPlayer:AVAudioPlayer? = nil
  var hehePlayer:AVAudioPlayer? = nil
  
  func loadSound(filename:NSString) -> AVAudioPlayer {
    let url = NSBundle.mainBundle().URLForResource(filename as String, withExtension: "caf")
    var error:NSError? = nil
    let player = AVAudioPlayer(contentsOfURL: url, error: &error)
    if error != nil {
      println("Error loading \(url): \(error?.localizedDescription)")
    } else {
      player.prepareToPlay()
    }
    return player
  }
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    //1
    
    myFunction("bla", functionToExecute: functionToPass)
    myFunction("bla", functionToExecute: {(str) -> String in return("This is the string passed: \(str)")})
    myFunction("bla", functionToExecute:  { return($0)})
    myFunction("bla", functionToExecute: { return("This is the string passed:\($0)")})


    
    let filteredSubviews = self.view.subviews.filter({
      $0.isKindOfClass(UIImageView) })
    // 2
    for view in filteredSubviews  {
      // 3
      let recognizer = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
      // 4
      recognizer.delegate = self
      view.addGestureRecognizer(recognizer)
      
      recognizer.requireGestureRecognizerToFail(monkeyPan)
      recognizer.requireGestureRecognizerToFail(bananaPan)
      
      //TODO: Add a custom gesture recognizer too
      let recognizer2 = TickleGestureRecognizer(target: self, action: Selector("handleTickle:"))
      recognizer2.delegate = self
      view.addGestureRecognizer(recognizer2)
    }
    self.chompPlayer = self.loadSound("chomp")
    self.hehePlayer = self.loadSound("hehehe1")
    
    
    var arrayOfString = ["Ebene", "Alexandre"]
    
    var didWeFindIt = self.findSearchTerm(arrayOfString, searchTerm: "rr")


  }
  
    
   
    func ReverseString(string: String) {
        //Create empty character Array.
        var strArray:[Character] = [Character]()
        
        //Loop through each character in the String
        for character in string {
            //Insert the character in the Array variable.
            strArray.append(character)
        }
        
        //Create a empty string
        var reversedString = ""
        
        //Read the array from backwards to get the characters
        for var index = strArray.count - 1; index >= 0;--index {
            //Concatenate character to String.
            reversedString += String(strArray[index])
        }
        
        
    }
    
    
    func findSearchTerm(arrayOfString: [String], searchTerm: String) -> Bool {
   
        var foundSearchTerm = false
        for string in arrayOfString {
        
            if string.rangeOfString(searchTerm) != nil {
         
                foundSearchTerm = true
            }
        
        }
       
        return foundSearchTerm
    }
    
    @IBAction func unwindToViewController(segue:UIStoryboardSegue) {
        
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController,
        fromViewController: UIViewController,
        identifier: String?) -> UIStoryboardSegue {
            return UIStoryboardSegue(identifier: "UnwindSegue", source: fromViewController, destination: toViewController) {
                
                // Assign the source and destination views to local variables.
                var toVCView = toViewController.view as UIView!
                var fromVCView = fromViewController.view as UIView!
                
                // Get the screen width and height.
                let screenWidth = UIScreen.mainScreen().bounds.size.width
                let screenHeight = UIScreen.mainScreen().bounds.size.height
                
                // Specify the initial position of the destination view.
                toVCView.frame = CGRectMake(0.0, 0, screenWidth, screenHeight)
                fromVCView.frame = CGRectMake(0.0, 0, screenWidth, screenHeight)
                
                
                // Access the app's key window and insert the destination view above the current (source) one.
                let window = UIApplication.sharedApplication().keyWindow
                
                
                window?.insertSubview(toVCView, belowSubview: fromVCView)
                
                window?.insertSubview(fromVCView, aboveSubview: toVCView)
                
                // Animate the transition.
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    
                    fromVCView.frame = CGRectOffset(fromVCView.frame, 0.0, -screenHeight)
                    
                    }) { (Bool) -> Void in
                        
                        
                        fromViewController.dismissViewControllerAnimated(false, completion: nil)
                }
                
            }
    }
    
    
    
    
    
    func isPalindrome(str:String) -> Bool {
        if (count(str) == 0 || count(str) == 1) {
            return true
        }
        let removeRange = Range<String.Index>(start: advance(str.startIndex, 1), end: advance(str.endIndex, -1))
        if (str[0] == str[count(str) - 1]) {
            
            return isPalindrome(str.substringWithRange(removeRange))
        }
        return false
    }


    
    func functionToPass(str: String) -> String {
        return("This is the string passed: \(str)")
    }
    
    func myFunction(stringToPass: String, functionToExecute: (String) -> String) {
        
        for i in 1...10 {
            println(functionToExecute(stringToPass))
            
        }
        
    }



    
  @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
    //comment for panning
    //uncomment for tickling
    return;
    
    let translation = recognizer.translationInView(self.view)
    if let view = recognizer.view {
      view.center = CGPoint(x:view.center.x + translation.x,
        y:view.center.y + translation.y)
    }
    recognizer.setTranslation(CGPointZero, inView: self.view)
    
    if recognizer.state == UIGestureRecognizerState.Ended {
      // 1
      let velocity = recognizer.velocityInView(self.view)
      let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
      let slideMultiplier = magnitude / 200
      println("magnitude: \(magnitude), slideMultiplier: \(slideMultiplier)")
      
      // 2
      let slideFactor = 0.1 * slideMultiplier     //Increase for more of a slide
      // 3
      var finalPoint = CGPoint(x:recognizer.view!.center.x + (velocity.x * slideFactor),
        y:recognizer.view!.center.y + (velocity.y * slideFactor))
      // 4
      finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
      finalPoint.y = min(max(finalPoint.y, 0), self.view.bounds.size.height)
      
      // 5
      UIView.animateWithDuration(Double(slideFactor * 2),
        delay: 0,
        // 6
        options: UIViewAnimationOptions.CurveEaseOut,
        animations: {recognizer.view!.center = finalPoint },
        completion: nil)
    }
    
  }
  
  @IBAction func handlePinch(recognizer : UIPinchGestureRecognizer) {
    if let view = recognizer.view {
      view.transform = CGAffineTransformScale(view.transform,
        recognizer.scale, recognizer.scale)
      recognizer.scale = 1
    }
  }
  
  @IBAction func handleRotate(recognizer : UIRotationGestureRecognizer) {
    if let view = recognizer.view {
      view.transform = CGAffineTransformRotate(view.transform, recognizer.rotation)
      recognizer.rotation = 0
    }
  }
 
  func gestureRecognizer(UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
      return true
  }
  
  func handleTap(recognizer: UITapGestureRecognizer) {
    self.chompPlayer?.play()
  }
  
  func handleTickle(recognizer:TickleGestureRecognizer) {
    self.hehePlayer?.play()
  }
  
}

