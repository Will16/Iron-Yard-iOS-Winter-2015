//
//  ViewController.m
//  ScribbleTouch
//
//  Created by Jo Albright on 1/14/15.
//  Copyright (c) 2015 Jo Albright. All rights reserved.
//

#import "ViewController.h"
#import "ScribbleView.h"
#import "ChoiceViewController.h"


// HOMEWORK: SLIDER HINTS (MAKE A RECTANGLE SIDE OF SLIDER) DRAW LNE MIDDLE HEIGHT OF RECTANGLE, DRAW CIRCLE WITH WIDTH AND HEIGHT SAME HEIGHT OF THE FRAME (CORNER RADIUS HALF OF HEIGHT) ADD TOUCHES TO THE VIEW (TOUCHESBEGAN AND MOVED), MODE THE CIRCLE BASED ON WHAT WE TOUCHED ON THAT VIEW)
// ALSO DESIGN  IMAGE FOR THE ICON

// HOMEWORK:
// make boolean button, click arrow to flip the settings view or make them appear
@interface ViewController () <ChoiceViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *blendModeButton;
@property (weak, nonatomic) IBOutlet UIButton *shapeTypeButton;
@property (weak, nonatomic) IBOutlet UIButton *toggleButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *drawerLeftConstraints;

@property (weak, nonatomic) IBOutlet UIButton *clearButton;

@property (weak, nonatomic) IBOutlet UIButton *undoButtton;

@property (weak, nonatomic) IBOutlet UIButton *blendButton;
@property (weak, nonatomic) IBOutlet UIButton *shapeButton;

@property (weak, nonatomic) IBOutlet UIButton *clearStrokeButton;
@property (weak, nonatomic) IBOutlet UIButton *clearFillButton;

@property (weak, nonatomic) IBOutlet UIImageView *shapeView;
@property (weak, nonatomic) IBOutlet UIButton *displayStrokeColor;

@property (weak, nonatomic) IBOutlet UIButton *displayFillColor;

@property (weak, nonatomic) IBOutlet UIButton *strokeWidthDisplayButton;
@property (weak, nonatomic) IBOutlet UIView *displayWidthStrokeView;

@property (weak, nonatomic) IBOutlet UIButton *alphaDisplayButton1;
@property (weak, nonatomic) IBOutlet UIButton *alphaDisplayButton2;


@property (weak, nonatomic) IBOutlet UIButton *blendDisplayButton1;
@property (weak, nonatomic) IBOutlet UIButton *blendDisplayButton2;
@property (weak, nonatomic) IBOutlet UIImageView *blendView1;


@property (weak, nonatomic) IBOutlet UIImageView *blendView2;




@end

@implementation ViewController
{
    NSMutableDictionary * currentScribble;
    
    // COMMAN CONTROL E, CHANGE THE NAME OF ALL VARIABLE
    UIColor * selectedStrokeColor;
    UIColor *selectedFillColor;
    int selectedStrokeWidth;
    
 
    
    float shapeAlpha;
    
    NSString *selectedBlendMode;
    NSString *selectedShapeType;
    
    __weak IBOutlet UIView *settingsView;
 
    __weak IBOutlet UIButton *showSettings;
    __weak IBOutlet UIButton *hideSettings;
    
    UIButton *button;
}

- (void)viewDidLoad {
    [super viewDidLoad];

   
    [_clearButton.layer setBorderWidth:1.0];
    [_clearButton.layer setBorderColor:[[UIColor redColor] CGColor]];
    
    [_undoButtton.layer setBorderWidth:1.0];
    [_undoButtton.layer setBorderColor:[[UIColor blackColor] CGColor]];
    
    selectedFillColor = [UIColor blackColor];
    selectedStrokeColor = [UIColor blackColor];

    selectedStrokeWidth = 1;
    selectedBlendMode = @"Normal";
    selectedShapeType = @"Scribble";
    
    [_blendButton.layer setBorderWidth:1.0];
    [_blendButton.layer setBorderColor:[[UIColor blackColor] CGColor]];
    
    [_shapeButton.layer setBorderWidth:1.0];
    [_shapeButton.layer setBorderColor:[[UIColor blackColor] CGColor]];
    
    [_displayStrokeColor.layer setBorderWidth:1.0];
    [_displayStrokeColor.layer setBorderColor:[[UIColor blackColor] CGColor]];

    button = [[UIButton alloc] init];
    CGRect buttonFrame = _strokeWidthDisplayButton.frame;
    buttonFrame.size = CGSizeMake(20, 20);
    [button setFrame:CGRectMake( 15, 15, 1, 1)];
    
    button.layer.cornerRadius = 0.5;
    button.backgroundColor = [UIColor blackColor];

    
    
    [_displayWidthStrokeView addSubview:button];
    [_displayWidthStrokeView.layer setBorderWidth:1];
    [_displayWidthStrokeView.layer setBorderColor:[[UIColor blackColor] CGColor]];
    
    _strokeWidthDisplayButton.frame = buttonFrame;

    _strokeWidthDisplayButton.layer.cornerRadius = 0.5;
    
     //  clearFillButton.imageView =

  

    
    UIImage *clearButtonImage = [UIImage imageNamed:@"clearButton.jpg"];
    
    
     [_clearStrokeButton setBackgroundImage:clearButtonImage forState:UIControlStateNormal];
    [_clearFillButton setBackgroundImage:clearButtonImage forState:UIControlStateNormal];
 
 
     _clearStrokeButton.backgroundColor = [UIColor clearColor];
    _clearFillButton.backgroundColor = [UIColor clearColor];
    
    _clearStrokeButton.tag = 1;
    _clearFillButton.tag = 1;
    shapeAlpha = 1;
   
    
    buttonFrame.size.width = 1;

    
    _blendDisplayButton1.alpha = 0.5;
    _blendDisplayButton2.alpha = 0.5;
    

}

- (IBAction)changeStrokeColor:(UIButton *)sender {
    
      selectedStrokeColor = sender.backgroundColor;
    if (sender.backgroundColor == [UIColor clearColor]) {
        [_displayStrokeColor.layer setBorderColor:[UIColor clearColor].CGColor];
    }
    else {
        [_displayStrokeColor.layer setBorderColor:sender.backgroundColor.CGColor];
    }
  
    
    



}

- (IBAction)changeFillColor:(UIButton *)sender {
    
    selectedFillColor = sender.backgroundColor;
    if (sender.backgroundColor == [UIColor clearColor]) {
        _displayFillColor.backgroundColor = [UIColor clearColor];
        UIImage *clearButtonImage = [UIImage imageNamed:@"clearButton.jpg"];
          [_displayFillColor setBackgroundImage:clearButtonImage forState:UIControlStateNormal];
        
    }
    else {
          [_displayFillColor setBackgroundImage:nil forState:UIControlStateNormal];
    _displayFillColor.backgroundColor = sender.backgroundColor;
    }
    
    
}

// problem when we try to assign the center of button to center of view
- (IBAction)changeStrokeWidth:(UISlider *)sender {
    
    selectedStrokeWidth = sender.value;
    CGRect buttonFrame = _strokeWidthDisplayButton.frame;
    buttonFrame.size = CGSizeMake(buttonFrame.size.width + 10, buttonFrame.size.height + 10);
    // can't assign the frame.width and heigth but can assign the frame with a cgrect
    

    button.layer.cornerRadius = sender.value/2;
     button.backgroundColor = [UIColor blackColor];
    _strokeWidthDisplayButton.frame = buttonFrame;
    _strokeWidthDisplayButton.layer.cornerRadius = sender.value/2;
    
    [button setFrame:CGRectMake( 15, 15, sender.value, sender.value)];

    button.center = CGPointMake(button.center.x - sender.value/2, button.center.y - sender.value/2);
    
    
}

- (IBAction)changeAlpha:(UISlider *)sender {
    shapeAlpha = sender.value;
    
    _alphaDisplayButton1.alpha = sender.value;
    _alphaDisplayButton2.alpha = sender.value;
}


// When we click on blend mode button, we go to choiceVC
- (IBAction)changeBlendMode:(id)sender {
    ChoiceViewController *choiceVC = [self.storyboard instantiateViewControllerWithIdentifier:@"choiceVC"];
    
    choiceVC.delegate = self;
    choiceVC.group = @"BlendMode";
    choiceVC.choices = @[
                         @"Normal",
                         @"Multiply",
                         @"Overlay",
                         @"Screen",
                         @"Clear"
                         ];
    
    // PRESENT FROM BOTTOM TO TOP AND NO NAVGATION CONTROLLER (NO BACK BUTTON)
    // PUSH NVC (WITH BACK BUTTON) FROM RIGHT TO LEFT
    [self presentViewController:choiceVC animated:NO completion:nil];
}

// if we click on the changeshape button go to choiceVC, and transfer the choices array to ChoiceVC

- (IBAction)changeShapeType:(id)sender {
    ChoiceViewController *choiceVC = [self.storyboard instantiateViewControllerWithIdentifier:@"choiceVC"];
    
    
    choiceVC.delegate = self;
    choiceVC.group = @"ShapeType";
    choiceVC.choices = @[
                         @"Scribble",
                         @"Line",
                         @"Rectangle",
                         @"Ellipse",
                         @"Triangle"
                         ];
    
     [self presentViewController:choiceVC animated:NO completion:nil];
}
- (IBAction)showHideDrawer:(UIButton *)sender {
    
    
    // the constraints for our scribbleView is -16 to the left and the scribbleView width is 300 (so we move 244 to the left) the right is still visible so the toggle button is visible too
    

    
    // rotate 180 degrees or 0 degrees
    CGFloat rotationValue = (self.drawerLeftConstraints.constant == -16) ? M_PI: 0;
    
    // ALWAYS COMPARED TO INITIAL VALUE OF BUTTON NOT ON LATEST TANSFORM
    sender.transform = CGAffineTransformMakeRotation(rotationValue);
    
    self.drawerLeftConstraints.constant = (self.drawerLeftConstraints.constant == -16) ? -260: -16;
    

    
   /* if ((sender.tag == 1)) {
        
        [UIView animateWithDuration:0.3 animations:^{
         
         //   [settingsView setCenter:(300, 200)];

        
              settingsView.hidden = true;
            
            showSettings.hidden = false;
            
        }];

        
    }
    
    if ((sender.tag == 2)) {
        settingsView.hidden = false;
    }
    */
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch * touch = touches.allObjects.firstObject;
    
    CGPoint location = [touch locationInView:self.view];
    
    
    currentScribble = [@{
                         
                         @"type":selectedShapeType,
                         @"blend":selectedBlendMode,
                         @"fillColor":selectedFillColor,
                         @"strokeColor":selectedStrokeColor,
                         @"strokeWidth":@(selectedStrokeWidth),
                         @"points":[@[[NSValue valueWithCGPoint:location],[NSValue valueWithCGPoint:location]] mutableCopy],
                         @"shapeAlpha":@(shapeAlpha)
                         
                         } mutableCopy];
    
    ScribbleView * sView = (ScribbleView *)self.view;
    [sView.scribbles addObject:currentScribble];
    
}

- (IBAction)undoStage:(id)sender {
    ScribbleView * sView = (ScribbleView *)self.view;
    [sView undoStage];
}


- (IBAction)clearStage:(id)sender {
    
    // calls a method in our DLASTAGESCRIBBLE class
    ScribbleView * sView = (ScribbleView *)self.view;
    [sView clearStage];
}




- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch * touch = touches.allObjects.firstObject;
    
    CGPoint location = [touch locationInView:self.view];
    
    if ([selectedShapeType isEqualToString:@"Scribble"]) {
        
        [currentScribble[@"points"] addObject:[NSValue valueWithCGPoint:location]];
    }
    
    else {
        
        // WE UPDATE THE SECOND POINT TO CHANGE THE END (IT WILL DRAW ONLY A LINE INSTEAD OF A SCRIBBLE PATH) (EQUALS NOT ADDOBJECT)
        currentScribble[@"points"][1] = [NSValue valueWithCGPoint:location];
    }

    
    [self.view setNeedsDisplay];
}

-(void) choice:(NSString *)choice forGroup:(NSString *)group {
    if([group isEqualToString:@"BlendMode"]) {
        
        selectedBlendMode = choice;
        [self.blendModeButton  setTitle:choice forState:UIControlStateNormal];
    }
    if([group isEqualToString:@"ShapeType"]) {
        
        selectedShapeType = choice;
        [self.shapeTypeButton  setTitle:choice forState:UIControlStateNormal];
        
        NSString *imageName = [NSString stringWithFormat:@"%@.png", choice];
        _shapeView.image = [UIImage imageNamed:imageName];
        
    }
    
    NSLog(@"Choice = %@ for Group %@", choice, group);
}

@end
