//
//  ViewController.m
//  Shapes
//
//  Created by William McDuff on 2015-01-13.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

// HOMEWORK

// 1. Make 3 Classes based on UIView (Rectangle, Ellipse, Triangle)

// 2. Uncomment the drawRect function (done)

// 3. Google CGContext drawing in drawRect

// 4. 10 different shapes with different colors (rectangle, ellipse, triangle but of different sizes and colors)

// Hints: If I add ellipse on my VC it needs to be an ellipse in that rectangle (the UIView frame) (based on the frame of the view) : UIVIew allocInitWithFrame: CGRect()) that drawrect is the same as the standard drawrect method in UIView (with width and size)

#import "ViewController.h"
#import "Rectangle.h"
#import "Triangle.h"
#import "Ellipse.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
