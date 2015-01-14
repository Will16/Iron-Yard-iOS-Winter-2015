//
//  Ellipse.m
//  Shapes
//
//  Created by William McDuff on 2015-01-13.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "Ellipse.h"

@implementation Ellipse

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)ellipse {
    // Drawing code
    
   
    ellipse.size.width = _width;
    ellipse.size.height = _heigth ;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 1.0);
    
    CGContextSetStrokeColorWithColor(context, _drawingColor);
    

    CGRect rectangle = CGRectMake(ellipse.origin.x, ellipse.origin.y, ellipse.size.width, ellipse.size.height);
    
    CGContextAddEllipseInRect(context, rectangle);
    
    
    
    CGContextStrokePath(context);

   
}



@end
