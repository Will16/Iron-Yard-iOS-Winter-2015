//
//  Triangle.m
//  Shapes
//
//  Created by William McDuff on 2015-01-13.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "Triangle.h"

@implementation Triangle {
    
   
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)triangle {
    // Drawing code
    

    
    triangle.size.width = _width;
    
    triangle.size.height = _heigth;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
     CGContextSetStrokeColorWithColor(ctx, _drawingColor);
    
    // starts at (0,0)
    CGContextBeginPath(ctx);
    CGContextMoveToPoint (ctx, CGRectGetMinX(triangle), CGRectGetMinY(triangle));  // top left
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(triangle), CGRectGetMidY(triangle));  // mid right
    CGContextAddLineToPoint(ctx, CGRectGetMinX(triangle), CGRectGetMaxY(triangle));  // bottom left
    CGContextClosePath(ctx);
    
   
    CGContextSetFillColorWithColor(ctx, _drawingColor);
    CGContextFillPath(ctx);
    

    
}





@end
