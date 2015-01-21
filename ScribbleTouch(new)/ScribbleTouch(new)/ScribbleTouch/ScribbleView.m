//
//  ScribbleView.m
//  ScribbleTouch
//
//  Created by Jo Albright on 1/14/15.
//  Copyright (c) 2015 Jo Albright. All rights reserved.
//

#import "ScribbleView.h"

@implementation ScribbleView

//    @[
//
//        @{
//            @"type":@"path",
//            @"fillColor":[UIColor greenColor],
//            @"strokeColor":[UIColor blackColor],
//            @"strokeWidth":@2,
//            @"points":@[CGPoint,CGPoint,CGPoint]
//        },
//
//        @{
//            @"type":@"circle",
//            @"fillColor":[UIColor greenColor],
//            @"strokeColor":[UIColor blackColor],
//            @"strokeWidth":@2,
//            @"frame":CGRect
//        }
//
//    ];



- (NSMutableArray *)scribbles {
    
    if (_scribbles == nil) { _scribbles = [@[] mutableCopy]; }
    return _scribbles;
    
}

- (void)undoStage
{
    
    //[self.lines removeLastObject];
    [self.scribbles removeLastObject];
    [self setNeedsDisplay];
  
}

- (void)clearStage
{
    
    
    
    self.scribbles = [@[] mutableCopy];
  
    
    [self setNeedsDisplay];

}

// CREATE A ROUND IMAGEVIEW WITH A BLACK SQUARE IMAGE ON IT 
// TWO IMAGE VIEW (FOR BLEND ICON)
/*
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [image1.image drawInRect:image1.frame blendMode:kCGBlendModeMultiply alpha:1];
    [image2.image drawInRect:image2.frame blendMode:kCGBlendModeMultiply alpha:1];
    [super drawRect:rect];
}
*/

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


// FIRST ONE LOOP WITH 3 LOOPS REPETED 2 TIMES (ONE FOR STROKE ONE FOR FILL) AND ONE LOOP FOR BLEND MODE WITH 3 LOOPS (ONLY FOR BLEND MODE)
- (void)drawRect:(CGRect)rect {
    
    
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
 //  CGContextRef context2 = UIGraphicsGetCurrentContext();
    
    for (NSDictionary * scribble in self.scribbles) {
        
        NSArray * points = scribble[@"points"];

        // continue break the instance of the loop, break breaks whole loop, return breaks whole func

        if (points.count < 2) continue;
        
        [self drawWithContext:context andScribble:scribble andType:@"Fill"];
        [self drawWithContext:context andScribble:scribble andType:@"Stroke"];
        
     

    }
    

}

- (void)drawWithContext:(CGContextRef)context andScribble:(NSDictionary *)scribble andType:(NSString *)type {
    
    
    NSDictionary * blendKeys = @{
                                 @"Normal": @(kCGBlendModeNormal),
                                 @"Multiply": @(kCGBlendModeMultiply),
                                 @"Overlay": @(kCGBlendModeOverlay),
                                 @"Screen": @(kCGBlendModeScreen),
                                 @"Clear": @(kCGBlendModeClear)
                               
                                 };
    
    NSArray * points = scribble[@"points"];
    
    
    /////////// STROKE COLOR & WIDTH
    
    CGContextSetLineWidth(context, [scribble[@"strokeWidth"] floatValue]);
    
    NSNumber *alphaObject =  scribble[@"shapeAlpha"];
    //transform NSNumber to Float
    CGFloat alpha = [alphaObject floatValue];
    
    UIColor *strokeColorNoAlpha = scribble[@"strokeColor"];
    
    
    if (!(strokeColorNoAlpha == [UIColor clearColor])) {
        UIColor *strokeColor = [strokeColorNoAlpha colorWithAlphaComponent:alpha];
        
        
        
        CGContextSetStrokeColorWithColor(context, strokeColor.CGColor);
    }
    
    else {
        UIColor *strokeColor = [UIColor clearColor];
        CGContextSetStrokeColorWithColor(context, strokeColor.CGColor);
    }
    
    
    
    
    UIColor *fillColorNoAlpha = scribble[@"fillColor"];
    
    if (!(fillColorNoAlpha == [UIColor clearColor])) {
        UIColor *fillColor = [fillColorNoAlpha colorWithAlphaComponent:alpha];
        CGContextSetFillColorWithColor(context, fillColor.CGColor);
    }
    else {
        UIColor *fillColor = [UIColor clearColor];
        CGContextSetFillColorWithColor(context, fillColor.CGColor);
    }
    
    

    
    NSString *blendMode = scribble[@"blend"];
    CGContextSetBlendMode (context, [blendKeys[blendMode] intValue]);
    
    ////////// BUILD STROKE PATH
    
    NSArray * types = @[@"Scribble",@"Line",@"Rectangle",@"Triangle",@"Ellipse"];
    
    CGPoint firstPoint = [points[0] CGPointValue];
    CGPoint secondPoint = [points[1] CGPointValue];
    
    CGFloat width = secondPoint.x - firstPoint.x;
    CGFloat height = secondPoint.y - firstPoint.y;
    
    CGRect rect = CGRectMake(firstPoint.x, firstPoint.y, width, height);
    
    // scribble[type] is the type of our object, and we search for the index of this string in our array types
    switch ([types indexOfObject:scribble[@"type"]]) {
            
              // scribble or line
        case 0:
            CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
            
            for (NSValue * pointValue in points) {
                
                CGPoint point = [pointValue CGPointValue];
                CGContextAddLineToPoint(context, point.x, point.y);
                
            }

            
        case 1:
            
            CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
            
            for (NSValue * pointValue in points) {
                
                CGPoint point = [pointValue CGPointValue];
                CGContextAddLineToPoint(context, point.x, point.y);
                
            }
            
            
            break;
           
              // Rectangle
        case 2:
            
            CGContextAddRect(context, rect);
            
            break;
            
            // Triangle
        case 3:
            
            CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
            CGContextAddLineToPoint(context, secondPoint.x, secondPoint.y);
            CGContextAddLineToPoint(context, firstPoint.x + fabs(height), firstPoint.y );
            CGContextAddLineToPoint(context, firstPoint.x, firstPoint.y);
            
            
            /* alternative (JO):
             
             // top middle point triangle (INITIAL DRAWING)
             CGContextAddLineToPoint(context, firstPoint.x + rect.size.width / 2, firstPoint.y);
             
             // second point (right bottom)
             
             CGContextAddLineToPoint(context, secondPoint.x,  secondPoint.y );
             
             // third point (left bottom)
             CGContextAddLineToPoint(context, firstPoint.x,  secondPoint.y);
             
             
             // redraw to top middle point (initial point)
             CGContextAddLineToPoint(context, firstPoint.x + rect.size.width/2, firstPoint.y);
             */
            
            break;
            
            // Ellipse
        case 4:
            
            if ([type isEqualToString:@"Stroke"])  {
            CGContextStrokeEllipseInRect(context, rect);
            }
            if ([type isEqualToString:@"Fill"])  {
                CGContextFillEllipseInRect(context, rect);
            }
            break;
            
        default:
            break;
    }
    
    
    if ([type isEqualToString:@"Fill"]) {
 
            CGContextFillPath(context);
        
    
       
        
    } else {
        
    
            CGContextStrokePath(context);
        
        
    }
    
    
}

@end
