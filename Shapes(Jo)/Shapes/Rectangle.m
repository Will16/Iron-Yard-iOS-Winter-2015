//
//  Rectangle.m
//  Shapes
//
//  Created by William McDuff on 2015-01-13.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "Rectangle.h"
IB_DESIGNABLE

@implementation Rectangle


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code

    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor purpleColor] set];
    
    CGContextMoveToPoint(context, 0, 0);
    
    
    CGContextAddLineToPoint(context, rect.size.width, 0);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
    CGContextAddLineToPoint(context, 0, rect.size.height);
    CGContextAddLineToPoint(context, 0, 0);
    
    CGContextFillPath(context);
    

    
}




/*
{
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 
 
 CGContextRef context = UIGraphicsGetCurrentContext();
 
 CGContextSetLineWidth(context, 20.0);
 
 [[UIColor redColor] set];
 
 //    CGContextFillEllipseInRect(context, CGRectMake(100, 100, 100, 100));
 
 [[UIColor colorWithWhite:1.0 alpha:0.5] set];
 
 //    CGContextStrokeEllipseInRect(context, CGRectMake(150, 100, 100, 100));
 
 
 //    CGContextAddEllipseInRect(context, CGRectMake(200, 100, 100, 100));
 //    CGContextStrokePath(context);
 //    CGContextAddEllipseInRect(context, CGRectMake(100, 100, 100, 100));
 //    CGContextStrokePath(context);
 //    CGContextAddEllipseInRect(context, CGRectMake(150, 100, 100, 100));
 //
 //    CGContextStrokePath(context);
 
 //    CGContextAddEllipseInRect(context, CGRectMake(200, 100, 100, 100));
 //    CGContextAddEllipseInRect(context, CGRectMake(100, 100, 100, 100));
 //    CGContextAddEllipseInRect(context, CGRectMake(150, 100, 100, 100));
 
 CGContextFillPath(context);
 
 
 CGContextMoveToPoint(context, 50, 50);
 
 CGContextAddLineToPoint(context, 100, 100);
 
 CGContextStrokePath(context);
 
 
 CGContextMoveToPoint(context, 100, 50);
 CGContextAddLineToPoint(context, 100, 150);
 //    CGContextAddLineToPoint(context, 50, 150);
 //    CGContextAddLineToPoint(context, 50, 50);
 
 CGContextStrokePath(context);
 }
 
} */

/*
 [UIView animateWithDuration:self.rippleLifeTime delay:delay options:UIViewAnimationOptionCurveEaseOut animations:^{
 
 rippleLine.frame = CGRectMake(-40, -40, 80, 80);
 rippleLine.alpha = 0;
 
 } completion:^(BOOL finished) {
 
 [rippleLine removeFromSuperview];
 
 }];
*/
@end
