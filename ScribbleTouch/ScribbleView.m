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

- (void)drawInRect:(CGRect)rect
         blendMode:(CGBlendMode)blendMode
             alpha:(CGFloat)alpha {
    
    
}

// TO USE BLENDMODE YOU NEED TO ADD A VIEW ON TOP OF ANOTHER (OR A DRAWING ON TOP OF ANOTHER AND THEN SET THE BLEND MODE ON THE VIEW ON TOP)

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    
    // for all the scribble take the stroke of our scribble, the color
    for (NSDictionary *scribble in self.scribbles) {
        
    
        CGContextSetLineWidth(context, [scribble[@"strokeWidth"] floatValue]);
        
        NSNumber *alphaObject =  scribble[@"alpha"];
        
        //transform NSNumber to Float
        CGFloat alpha = [alphaObject floatValue];
        
        
        UIColor *strokeColorNoAlpha = scribble[@"strokeColor"];
        UIColor *strokeColor = [strokeColorNoAlpha colorWithAlphaComponent:alpha];
        
        
        
        CGContextSetStrokeColorWithColor(context, strokeColor.CGColor);
        
        UIColor *fillColorNoAlpha = scribble[@"fillColor"];
        UIColor *fillColor = [fillColorNoAlpha colorWithAlphaComponent:alpha];
        
      
        
        
       CGContextSetFillColorWithColor(context, fillColor.CGColor);
        
        
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
        
        
        CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
      
        
        for (NSValue *pointValue in scribble[@"points"]) {
            CGPoint point = [pointValue CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);
            
            
        }
        CGContextFillPath(context);
        
    
    }
    
 
    CGContextRef context2 = UIGraphicsGetCurrentContext();

    
  //  CGContextSetBlendMode (context2, kCGBlendModeMultiply);
    CGContextSetBlendMode (context2, kCGBlendModeScreen);
    
    // for all the scribble take the stroke of our scribble, the color
    for (NSDictionary *scribble in self.scribbles) {
        
        
        CGContextSetLineWidth(context2, [scribble[@"strokeWidth"] floatValue]);
        
        NSNumber *alphaObject =  scribble[@"alpha"];
        
        //transform NSNumber to Float
        CGFloat alpha = [alphaObject floatValue];
        
        
        UIColor *strokeColorNoAlpha = scribble[@"strokeColor"];
        UIColor *strokeColor = [strokeColorNoAlpha colorWithAlphaComponent:alpha];
        
        
        
        CGContextSetStrokeColorWithColor(context2, strokeColor.CGColor);
        
        UIColor *fillColorNoAlpha = scribble[@"fillColor"];
        UIColor *fillColor = [fillColorNoAlpha colorWithAlphaComponent:alpha];
        
        
        
        
        CGContextSetFillColorWithColor(context2, fillColor.CGColor);
        
        
        // return the CGPointValue of our first point in our scribble
        CGPoint firstPoint = [scribble[@"points"][0] CGPointValue];
        
        // move context to our firstPoint in location
        CGContextMoveToPoint(context2, firstPoint.x , firstPoint.y);
        
        // for all the points in our scribble, add a line to the next point
        for (NSValue *pointValue in scribble[@"points"]) {
            CGPoint point = [pointValue CGPointValue];
            CGContextAddLineToPoint(context2, point.x, point.y);
            
            
        }
        
        CGContextStrokePath(context2);
        
        
        CGContextMoveToPoint(context2, firstPoint.x, firstPoint.y);
        
        
        for (NSValue *pointValue in scribble[@"points"]) {
            CGPoint point = [pointValue CGPointValue];
            CGContextAddLineToPoint(context2, point.x, point.y);
            
            
        }
        CGContextFillPath(context2);
    }

}



@end
