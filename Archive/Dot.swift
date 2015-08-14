//
//  Dot.swift
//  Archive
//
//  Created by William McDuff on 2015-02-26.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

import UIKit


// NSObject is an atom (everything buit upon it), AnyObject is like a wild card (any type of object)
class Dot: NSObject, NSCoding {
   
    var center: CGPoint!
    var diameter: CGFloat = 1
    
    var color: UIColor = UIColor.blackColor()
    
    init(center: CGPoint) {
        super.init()
        
        self.center = center
    }
    
    // called when unarchiving (it is already coded)
    
    required init(coder aDecoder: NSCoder) {
        
        // unarchive
        
        center = aDecoder.decodeCGPointForKey("center")
        
        diameter = CGFloat(aDecoder.decodeFloatForKey("diameter"))
        
        if let c = aDecoder.decodeObjectForKey("color") as? UIColor  {
        
              color = c
        }
        
    
    }
    

    
    // called when archiving (it is not coded)
    func encodeWithCoder(aCoder: NSCoder) {
        // archive
        
        aCoder.encodeCGPoint(center, forKey: "center")
        
        aCoder.encodeFloat(Float(diameter), forKey: "diameter")
        
        aCoder.encodeObject(color, forKey: "color")
        
    }
  
    
    convenience init(center: CGPoint, color: UIColor) {
        
        self.init(center: center)
        self.color = color
        
    }
    
    convenience init(center: CGPoint, diameter: CGFloat) {
        
        self.init(center: center)
        self.diameter = diameter
        
    }
    
    convenience init(center: CGPoint, color: UIColor, diameter: CGFloat) {
        
        self.init(center: center, color: color)
      
        self.diameter = diameter
        
    }
}
