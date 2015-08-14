//
//  ViewController.swift
//  Archive
//
//  Created by William McDuff on 2015-02-26.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

import UIKit

private let documentsDirectoryPath =  NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, false)[0] as String

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println(documentsDirectoryPath)
        
        loadDots()
        
        NSNotificationCenter.defaultCenter().addObserverForName("appIsClosing", object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            self.saveDots()
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveDots() {
        // get the dots from boardview
        // archive dots to file path
        
        let bView = self.view as BoardView
        
        NSKeyedArchiver.archiveRootObject(bView.dots, toFile: documentsDirectoryPath + "/dots.data")
        
    }
    
    func loadDots() {
        

        let bView = self.view as BoardView
        
        // get file path for dots archive
        // unarchive file path to dots array
        // set boardview dots
        
        if let dots = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsDirectoryPath + "/dots.data") as? [Dot] {
            bView.dots = dots
            
            bView.setNeedsDisplay()
        }
    }


}

