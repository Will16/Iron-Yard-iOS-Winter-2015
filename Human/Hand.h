//
//  Hand.h
//  Human
//
//  Created by William McDuff on 2015-01-06.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import <Foundation/Foundation.h>

// does not have to import finger, because when we import the thumb it also imports the finger but if we do @class we need to @class both finger and thumb


@class Finger;
@class Thumb;

@interface Hand : NSObject

@property (nonatomic) Finger *firstFinger;
@property (nonatomic) Finger *secondFinger;
@property (nonatomic) Finger *thirdFinger;
@property (nonatomic) Finger *fourthFinger;

@property (nonatomic) Thumb *thumb;


@end
