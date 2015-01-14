//
//  ScribbleView.m
//  ScribbleTouch
//
//  Created by William McDuff on 2015-01-14.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "ScribbleView.h"

@implementation ScribbleView


//EXAMPLE OF ARRAY OF DICT
/*
  @[
 
 // path that we trace with points in key points
            @{
                    @"type":@"path",
                    @"fillColor":[UIColor greencolor],
                    @"strokeColor":[UIColor blackColor],
                    @"strikeWidth":@2
                    @"points":@[CGPoint, CGPoint, CGPoint]

            },

 // cirlce that we trace in rect (inside the key frame)
            @{

                    @"type":@"circle",
                    @"fillColor":[UIColor greencolor],
                    @"strokeColor":[UIColor blackColor],
                    @"strikeWidth":@2
                    @"frame":CGRect


            }



    ];
*/

-(NSMutableArray *) scribbles {
    
    if(_scribbles == nil) {
        _scribbles = [@[] mutableCopy];
      
    }
    
      return _scribbles;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // for all the scribble take the stroke of our scribble, the color
    for (NSDictionary *scribble in self.scribbles) {
        
    
        CGContextSetLineWidth(context, [scribble[@"strokeWidth"] floatValue]);
        
        UIColor *strokeColor = scribble[@"strokeColor"];
               [strokeColor set];
        
        // return the CGPointValue of our first point in our scribble
        CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
        
        // move context to our firstPoint in location
        CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
        
        // for all the points in our scribble, add a line to the next point
        for (NSValue *pointValue in scribble[@"points"]) {
            CGPoint point = [pointValue CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);
        }
        
        CGContextStrokePath(context);
    }
    
 
    /*
    [[UIColor colorWithWhite:0.0 alpha:0.5] set];
    
    CGContextSetLineWidth(context, 30);
    CGContextAddEllipseInRect(context, CGRectMake(10, 10, 200, 200));
    CGContextAddEllipseInRect(context, CGRectMake(10, 100, 200, 200));
    
    CGContextFillPath(context);
    
    
    CGContextAddEllipseInRect(context, CGRectMake(10, 10, 200, 200));
    CGContextAddEllipseInRect(context, CGRectMake(10, 100, 200, 200));
    CGContextStrokePath(context);
     */
    // Drawing code
}



@end
