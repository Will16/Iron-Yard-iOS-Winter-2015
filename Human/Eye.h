//
//  Eye.h
//  Human
//
//  Created by William McDuff on 2015-01-06.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Eye : NSObject

@property NSString *eyeBall;
@property NSString *eyeLid;


-(BOOL)blink:(BOOL)prettyGirl;

@end
