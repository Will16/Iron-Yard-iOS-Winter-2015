//
//  APIRequest.m
//  ObjectiveCChallenge
//
//  Created by William McDuff on 2015-04-05.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "APIRequest.h"
#import "TableViewController.h"



@implementation APIRequest



-(void) fetchDataFromUrl {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL
                                                          URLWithString: @"http://de-coding-test.s3.amazonaws.com/books.json"]];
    
    
    NSError *error = nil;
    NSData *response = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil error:&error];
    
    if (error != nil) {
        
         NSLog(@"%@", error.localizedDescription);
    }
    
    else {
        NSError *jsonParsingError = nil;
        NSMutableArray *results = [NSJSONSerialization JSONObjectWithData:response
                                                                  options:0 error:&jsonParsingError];
        
        if (jsonParsingError != nil) {
            
            NSLog(@"%@", jsonParsingError.localizedDescription);
        }
        
        else {
            
            if (self.delegate != nil) {
                
                dispatch_async(dispatch_get_main_queue(),
                               ^{
                                  [self.delegate didFinishFetchingData:results];
                               });
                
             
                
                
            }
           
        }
        

    }
    
    
    
    

}

@end
