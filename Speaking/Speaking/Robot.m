//
//  Robot.m
//  Speaking
//
//  Created by William McDuff on 2015-01-13.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "Robot.h"

@implementation Robot

- (void)cleanHouse {
    int rooms = [self.delegate howManyRoomsDoIHaveToClean];
    
    NSLog(@"Robot starts cleaning %d rooms", rooms);
}

-(void)dance {
    
    
    NSString *danceStyle = [self.delegate whatTypeOfDance];
    NSLog(@"Robot starts to %@", danceStyle);
    
}

-(void)checkPower {
    
}

@end
