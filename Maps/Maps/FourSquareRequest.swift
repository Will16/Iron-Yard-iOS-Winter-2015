//
//  FourSquareRequest.swift
//  Maps
//
//  Created by William McDuff on 2015-02-02.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//


// ONLY FRAMEWORKS THAT YOU NEED TO IMPORT IN EACH FILE (OR CREATE A BRIDGING HEADER (BUT THEN IT WILL BE IMPORTED IN EVERY CLASS SO TAKES A LOT OF SPACE (NOT SUGGESTED IN MOST CASE))

import UIKit
import CoreLocation

let API_URL = "https://api.foursquare.com/v2/"
let CLIENT_ID = "C0QIAIRYKMEJNY33OTC0K5NBFWZKMDO05PVKTST4S0QS04XC"
let CLIENT_SECRET = "ITG3ACONWC1V0N3EWPNRJMULVMOQHWBWSDGJXXG52W3GR034"

class FourSquareRequest: NSObject {
   
    class func requestVenuesWithLocation(location: CLLocation) ->  [AnyObject] {
        
        
        
        // in url, ? is a query parameter, = is the value
        // percent (before client_secret) is for next parameter
        
        var latitude = location.coordinate.latitude
        var longitude = location.coordinate.longitude
        let requestString = "\(API_URL)venues/search?client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20130815&ll=\(location.coordinate.latitude),\(location.coordinate.longitude)"
       
        println(requestString)
        // go into the loop only if not nil (NSURL init returns an optional)
        if let url = NSURL(string: requestString) {
            
            
            
            let request = NSURLRequest(URL: url)
            
            
            // synchronous so it blocks the main thread to return the data
            if let data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil) {
                if let returnInfo = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as? [String:AnyObject] {
                    
                    let responseInfo = returnInfo["response"] as [String:AnyObject]
                    
                    let venues = responseInfo["venues"] as [AnyObject]
                
                    return venues
                    
                }
                
            }
        
        }
        
     
        
        
        
        // ClientId: C0QIAIRYKMEJNY33OTC0K5NBFWZKMDO05PVKTST4S0QS04XC
        
        // Clientsecret: ITG3ACONWC1V0N3EWPNRJMULVMOQHWBWSDGJXXG52W3GR034
        
        return []
    }
}
