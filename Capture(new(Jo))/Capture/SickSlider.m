//
//  SickSlider.m
//  Capture
//
//  Created by Ebony Nyenya on 1/21/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

#import "SickSlider.h"

@implementation SickSlider
{
    float sliderPosition;
}

// Since the slider is the whole view and is between 0 and 1, the x coordinate is its position * width of the view
-(void) setStartPosition:(float)startPosition {
    
    // the position is equal the start position (before we slide
    sliderPosition = startPosition * self.frame.size.width;
    [self setNeedsDisplay];
    _startPosition = startPosition;
    
}

- (UIColor *)sliderColor {
    
    if(_sliderColor == nil) {
        _sliderColor = [UIColor whiteColor];
    }
    
    return _sliderColor;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

// the rect is the view
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // set the slidercolor to be the color for stroke and fill
    [self.sliderColor set];
    
    CGContextSetLineWidth(context, 1);
    
    // CGRectInset: Returns a rectangle that is smaller or larger than the source rectangle, with the same center point.
    // with the bezier path creates a slider based on the vc view (5, 5 is not width and heigth )
    CGRect insetRect = CGRectInset(rect, 5, 5);
    

    // the cornerRadius is half rect.size.height/2 (rect is the vc view)
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:insetRect cornerRadius:rect.size.height/2];
    
    CGContextAddPath(context, path.CGPath);
    
    // bool to fill instead of stroke (for the slider)
    if (self.reverseColor) {
        
        CGContextFillPath(context);
        
    } else {
        
        CGContextStrokePath (context);
    }
    
    
    
    //this creates the little circle in the slider (the slider is insetRect and since inset  its round like the slider)
    //
    CGRect circleRect = CGRectInset(insetRect, 4, 4);
    circleRect.size.width = circleRect.size.height;
    
    
    // the min is the origin of the circle
    float minX = circleRect.origin.x;
    // the max is the rect width (WHOLE VIEW) - min of slider and minus the circle width
    float maxX = rect.size.width - minX - circleRect.size.width;
    
    // slider position is left of circle not center
    sliderPosition -= circleRect.size.width/2;
    
    // if sliderposition is more than max or min than stays max or min
    if (sliderPosition > maxX) sliderPosition = maxX;
    if (sliderPosition <minX) sliderPosition = minX;
    
    
    circleRect.origin.x = sliderPosition;
   
    
    // returns the slider position if the min was 0 (the position in the view)
    float value = sliderPosition  -  minX/ (maxX - minX);
    
    [self.delegate sliderDidFinishUpdatingWithValue:value];
    
    if (self.reverseColor) {
        
        
        // if we reverseColo the drawing color for the circle is the background color
        //CGContextSetBlendMode(context, kCGBlendModeXOR);
        [self.backgroundColor set];
        
    }
    
    // fill the circle
    CGContextFillEllipseInRect(context, circleRect);
 
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self updateSliderWithTouches:touches];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self updateSliderWithTouches:touches];
}

-(void)updateSliderWithTouches:(NSSet *)touches

{
    UITouch *touch = touches.allObjects.firstObject;
    
    CGPoint location = [touch locationInView:self];
    
    // change the location x according to how we move
    sliderPosition = location.x;
    
    [self setNeedsDisplay];
    
}


@end


