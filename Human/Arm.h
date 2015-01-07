//
//  Arms.h
//  Human
//
//  Created by William McDuff on 2015-01-06.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import <Foundation/Foundation.h>

// import can create loops (if we import hand in arm and arm in hand it creates infinite loops and create runtime problems) to prevent use @class nameOfTheClass (it says that we are going to use the hand class but we do not import it (we make  a promise that we are going to use the hand class (otherwise the app crashes) WE HAVE TO IMPORT HAND.H IN ARM.M THOUGH). When we subclass import is required though

@class Hand;

@interface Arm : NSObject

@property (nonatomic) Hand *hand;


@end
