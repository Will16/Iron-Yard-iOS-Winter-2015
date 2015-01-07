//
//  PrettyButton.h
//  FirstApp
//
//  Created by William McDuff on 2015-01-05.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import <UIKit/UIKit.h>

// make changes visible in storyboard

IB_DESIGNABLE

@interface PrettyButton : UIButton


// make the variable changable in the attributes inspector

@property (nonatomic) IBInspectable int cornerSize;

@end
