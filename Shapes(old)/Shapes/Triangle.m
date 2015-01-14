//
//  Triangle.m
//  Shapes
//
//  Created by William McDuff on 2015-01-13.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "Triangle.h"
IB_DESIGNABLE

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


- (void)drawRect:(CGRect)rect {
    // Drawing code
    

    // IF WE DO FILL STROKE WE NEED TO TRACE ALL PATH, BUT IF WE DO FILL DON'T NEED TO FILL THE LAST LINE OF PATH, IT WILL FILL ALL
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // go to middle up (WITHOUT TRACING)
    CGContextMoveToPoint(context, rect.size.width/2, 0);
    
    
    // trace bottom right
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
    
    // trace bottom left
    CGContextAddLineToPoint(context, 0, rect.size.height);
    
    // fill triangle (DON'T NEED TO DO LAST LINE SINCE FILL
    CGContextFillPath(context);
    

    /*
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
    
*/
    
}





@end
