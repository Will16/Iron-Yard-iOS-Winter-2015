//
//  Human.m
//  Speaking
//
//  Created by William McDuff on 2015-01-13.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "Human.h"
#import "Robot.h"


// interface extension: TO ADD PRIVATE PROPERTIES
@interface Human () <RobotDelegate>

@end

@implementation Human  {
    Robot *robot;
}

-(void) makeRobot {
    
    Robot *oldRustyRobot = [[Robot alloc] init];
    oldRustyRobot.delegate = self;
    
    [oldRustyRobot cleanHouse];
    [oldRustyRobot dance];
}

- (int)howMuchPowerCanIHave {
    
    return @"The Robot";
}
- (int)howManyRoomsDoIHaveToClean {
    
    return 1000000;
}

- (NSString *)whatTypeOfDance {
    
    return @"Rumba";
}


@end
