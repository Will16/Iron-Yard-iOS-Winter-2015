//
//  Human.h
//  Human
//
//  Created by William McDuff on 2015-01-06.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import <Foundation/Foundation.h>

// Create a body class and add it as a property to Human

// Create Leg, Head Class and add them and Arm as properties on the Body

// Add 10 additional Classes for other parts

// Create 2 methods on each class (EX: Mouth will have - (void)chewFood:(id)food;)

// Add 2 properties per class that define the part (not including properties like finger)

@class Body;


@interface Human : NSObject

@property (nonatomic) Body *body;


@end
