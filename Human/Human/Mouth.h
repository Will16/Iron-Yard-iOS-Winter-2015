//
//  Mouth.h
//  Human
//
//  Created by William McDuff on 2015-01-06.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mouth : NSObject

@property NSString *teeth;
@property NSString *lip;


-(BOOL)chewFood:(int)foodSize;

@end
