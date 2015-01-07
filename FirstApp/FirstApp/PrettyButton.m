//
//  PrettyButton.m
//  FirstApp
//
//  Created by William McDuff on 2015-01-05.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "PrettyButton.h"

@implementation PrettyButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.layer.cornerRadius = self.cornerSize;
    
    self.layer.masksToBounds = true;
}




@end
