//
//  Body.m
//  Human
//
//  Created by William McDuff on 2015-01-06.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "Body.h"

@implementation Body


-(BOOL)exerciseBody: (BOOL)afterHolidays {
  
    
    if (afterHolidays == true) {
        return true;
    }
    
    else {
        return false;
    }
}

-(int)returnBodyWeigth: (BOOL)onTheBalance {
    
    if (onTheBalance == true) {
        return true;
    }
    
    else return false;
}

@end
