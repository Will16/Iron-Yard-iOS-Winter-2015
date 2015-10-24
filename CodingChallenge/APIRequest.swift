//
//  ApiRequest.swift
//  CodingChallenge
//
//  Created by William McDuff on 2015-04-03.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

import Foundation
import UIKit

protocol APIRequestProtocol
{
    
    func didFinishFetchingData(result: [[String: String]])
    
}


class APIRequest {
    
    var delegate : TableViewController?
    
    init(delegate: TableViewController?) {
        
        self.delegate = delegate
        
    }
    
    func fetchDataFromUrl()
    {
        
        var urlPath = NSURL(string: "http://de-coding-test.s3.amazonaws.com/books.json")
        
        var session = NSURLSession.sharedSession()
        
        var task = session.dataTaskWithURL(urlPath!) {
            
            data, response, error -> Void in
            
            // As of Xcode 6 Beta 6, ImplicitlyUnwrappedOptionals may no longer be used in boolean operations and must be compared directly to nil.
            if (error != nil) {
                
                println(error.localizedDescription)
                
            }
                
            else {
                
                
                var jsonError : NSError?
                
                var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as! [[String: String]]
                println(jsonResult)
                
                // Since NSError does not conform to BooleanType protocol, must explictly compare against nil as of Xcode 6 Beta 5
                if (jsonError != nil) {
                    
                    println(jsonError!.localizedDescription)
                    
                }
                
                
                if let apiDelegate = self.delegate {
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        
                        apiDelegate.didFinishFetchingData(jsonResult)
                        
                        
                    }
                    
                }
                
            }
            
        }
 
        task.resume()

    }

}
