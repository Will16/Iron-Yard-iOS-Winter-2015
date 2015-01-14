//
//  Robot.h
//  Speaking
//
//  Created by William McDuff on 2015-01-13.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RobotDelegate;



@interface Robot : NSObject

-(void)cleanHouse;
-(void)dance;

@property (nonatomic, assign) id <RobotDelegate> delegate;

@end

@protocol RobotDelegate <NSObject>

- (int)howMuchPowerCanIHave;
- (int)howManyRoomsDoIHaveToClean;
- (NSString *)whatTypeOfDance;

@end