//
//  Ellipse.m
//  Shapes
//
//  Created by William McDuff on 2015-01-13.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "Ellipse.h"
IB_DESIGNABLE

@implementation Ellipse

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect{
    // Drawing code
    
   
    // NOT OBJECTIVE C: C FUNCTION AND C TYPE VARIABLE
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.fillColor set];
    
    
    
    
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    
    // control points for exllipses
    CGFloat xCP = rect.size.width / 4;
    
    CGFloat yCP = rect.size.height / 4;
    
    // THE EASY WAY
    //  CGContextFillEllipseInRect(context, rect);
    
    
    
    // THE HARD WAY (NO FILLELIPSE METHOD): CREATE 4 ARCS (WITH 2 POINTS EACH AFFECTING ONE OF ITS NEAREST 4 POINTS IN THE ELLIPSE)
    
    // add 2 curve points top-right quarter of the view and add to RIGHT (ON X) AND MIDDLE (ON Y) POINT (SO THAT WE CREATE AND ARC BETWEEN TWO POINTS (MIDDLE AND RIGHT) OF THE TRIANGLE)
    // point one: 2 curve points: halfway between middle and right on x axis, and halfway between top and middle on y awis to the right (on x axis)
    
    CGContextMoveToPoint(context, w/2, 0);
    CGContextAddCurveToPoint(context, w - xCP, 0, w, yCP, w, h/2);
    
    // add 2 curve points in bottom right quarter to THE BOTTOM MIDDLE POINT OF VIEW
    CGContextAddCurveToPoint(context, w, h - yCP, w- xCP, h, w/2, h);
    
    
    // add curve (two points bottom left) left-half(on y point)
    CGContextAddCurveToPoint(context, xCP, h, 0, h - yCP, 0, h/2);
    
    
    // add curve (top left quarter) to middle-top point
    CGContextAddCurveToPoint(context, 0, yCP, xCP, 0, w/2, 0);
    
    CGContextFillPath(context);

   
}



@end
