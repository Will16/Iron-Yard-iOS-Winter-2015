//
//  Body.h
//  Human
//
//  Created by William McDuff on 2015-01-06.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Arm;
@class Head;
@class Leg;


@interface Body : NSObject


@property (nonatomic) Arm *arm;
@property (nonatomic) Head *head;
@property (nonatomic) Leg *leg;


-(BOOL)exerciseBody: (BOOL)afterHolidays;

-(int)returnBodyWeigth: (BOOL)onTheBalance;

@end
