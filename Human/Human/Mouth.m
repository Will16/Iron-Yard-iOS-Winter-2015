//
//  Mouth.m
//  Human
//
//  Created by William McDuff on 2015-01-06.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "Mouth.h"

@implementation Mouth





-(BOOL)chewFood:(int)foodSize {
    
  
    BOOL chew = false;
    if (foodSize < 10) {
        chew = true;
    }
    
    return chew;
}

-(BOOL)smile:(BOOL)prettyGirl {
    
    BOOL smile = false;
    
 
    if (prettyGirl == true) {
        smile= true;
    }
    
    return smile;
}


@end
