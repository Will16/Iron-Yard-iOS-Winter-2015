//
//  Finger.m
//  Human
//
//  Created by William McDuff on 2015-01-06.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "Finger.h"

@implementation Finger

// Synthesize means override getter and setter
// fingerPrint=_fingerPrint means for your fingerprint property we will create a local instance variable based on this property (_fingerPrint)
@synthesize fingerPrint=_fingerPrint;


// getter that returns the local instance variable value
- (NSString *) fingerPrint{
    
    return _fingerPrint;
}

// setter that sets the local instance variable to be equal that value
- (void)setFingerPrint:(NSString *)fingerPrint {
    
    _fingerPrint = fingerPrint;
}


@end
