//
//  ViewController.m
//  FirstApp
//
//  Created by William McDuff on 2015-01-05.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// Oulet = property



@end

@implementation ViewController



- (IBAction)bigButtonPressed:(id)sender {
    
    // before declaring NSString write @
    
    if ([self.myLabel.text  isEqual: @"Pressed"]) {
        self.myLabel.text = @"NotPressed";
    }
    
    else self.myLabel.text = @"Pressed";
}


@end
