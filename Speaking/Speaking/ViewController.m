//
//  ViewController.m
//  Speaking
//
//  Created by William McDuff on 2015-01-13.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "ViewController.h"
#import "myView.h"


@interface ViewController () <MyViewDelegate>

@end

@implementation ViewController {
    
    myView *view1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    view1 = [[myView alloc] init];
    
  
    
    // declare that we are the delegate
    view1.delegate = self;
    
    
    // IF WE LOG AFTER THIS LINE NAME WILL BE NIL (WHY? WE OVERRIDE THE SETTER IN MYVIEW.M IN WHICH WE SAID IF NAME BOB RETURN))
    view1.name = @"Bob";
    
    NSLog(@"%@", view1.name);


    

    
}

-(void)changeMyNameTo:(NSString *)name {
    
    NSLog(@"%@", name);
    
    view1.name = name;
    
    NSLog(@"%@", view1.name);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
