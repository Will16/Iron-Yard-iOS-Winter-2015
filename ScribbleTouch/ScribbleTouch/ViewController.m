//
//  ViewController.m
//  ScribbleTouch
//
//  Created by William McDuff on 2015-01-14.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "ViewController.h"
#import "ScribbleView.h"


// add a method to add fill  (movepoint add line to point) (first set the color for the fill) And make the strokes rounded (using join and cap) (no button do that automatically


@interface ViewController ()

@end

@implementation ViewController {
    NSMutableDictionary *currentScribble;
    
    UIColor *selectedColor;
    CGFloat alpha;
    int selectedStrokeWidth;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    selectedColor = [UIColor blackColor];
    alpha = 1;
}

- (IBAction)changeColor:(UIButton *)sender {
    
    selectedColor = sender.backgroundColor;
    selectedStrokeWidth = 1;

}

- (IBAction)changeStrokeWidth:(UISlider *)sender {
    selectedStrokeWidth = sender.value;
}

- (IBAction)changeAlpha:(UISlider *)sender {
    alpha = sender.value;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // touches.allobjects is a getter of NSET touches)
    // take the first touch in array allObjects of set touches
    UITouch *touch = touches.allObjects.firstObject;
    
    // CGPOINT IS NOT AN OBJECT BUT A PRIMITIVE (NO *)
    // return the location inview of the touch
    CGPoint location = [touch locationInView:self.view];
    
    // DICTIONARY MUTABLE COPY (BECAUSE OF THE FANCY BRACKET INSIDE NORMAL BRACKETS
    currentScribble = [@{
                         
                         @"type":@"path",
                         @"fillColor":selectedColor,
                         @"strokeColor":selectedColor,
                         
                         @"alpha":@(alpha),
                         
                         // Change int to NSNumber!! (strokeWidth is an Int)
                         @"strokeWidth":@(selectedStrokeWidth),
                         
                         // THE VALUE OF OUR LOCATION WHEN WE BEGAN TOUCHING
                         // NSVALUE VALUEWITHCGPOINT:LOCATION RETURNS AN ARRAY (SO WE CAN ADD OTHER POINTS)
                         
                         // ALL PRIMITIVES ARE C TYPES (WITHOUT AN ASTERIX)
                         @"points":[@[[NSValue valueWithCGPoint:location]] mutableCopy]
                         
                         
                         } mutableCopy];
    

    
    
    // CREATE A CAST TO LET THE DEBUGGER KNOW THAT SELF.VIEW WILL BE A SCRIBBLEVIEW AND NOT A UIVIEW
    
    // SCRIBBLE VIEW = SELF.VIEW LET THE CLASS KNOW THAT WHAT OUR STORYBOARD VIEW IS A SCRIBBLEVIEW
    // ANALOGY: CREATE A MASK FOR THE CLASS
    // THE OPPOSITE (SELFVIEW = SCRIBBLE.VIEW) WOULD OVERRIDE THE STORYBOARD VIEW, AND NOTHING WOULD SHOW INTO STORYBOARD (BECAUSE THE VIEW IS NOT A SCRIBBLEVIEW
    
    // TELL THE DEBUGGER THAT THE SELF.VIEW IS OF TYPE SCRIBBLEVIEW (LIKE WHEN WE CHANGE CUSTOM CLASS IN STORYBOARD (BUT DEBUGGER DOESN'T KNOW THAT
    // IN: ScribbleView *sView = (ScribbleView *) self.view, sView REALLY IS self.view (WE JUST CAST IT) (MORE ACCURATLY: IS POINTING TO SELF.VIEW (SINCE IT IS ONLY A POINTER (LIKE SELF.VIEW) SO BOTH POINT TO THE SAME OBJECT)
    
    [((ScribbleView *)self.view).scribbles addObject:currentScribble];
    
// Same things in two lines
   //   ScribbleView *sView = (ScribbleView *) self.view;
     
     // add the scribble array of dict in our property array of scribbles
     // [sView.scribbles addObject:currentScribble];
  
     
}

// WHEN THE TOUCH MOVES: SAY TO THE VC VIEW TO RENDER THE SCIBBLE (DRAW) (CALLS DRAWRECT)
-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = touches.allObjects.firstObject;
    
    CGPoint location = [touch locationInView:self.view];
    
    [currentScribble[@"points"] addObject:[NSValue valueWithCGPoint:location]];
    
    [self.view setNeedsDisplay];
    
}
@end
