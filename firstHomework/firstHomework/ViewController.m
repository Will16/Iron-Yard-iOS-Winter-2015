//
//  ViewController.m
//  firstHomework
//
//  Created by William McDuff on 2015-01-05.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "ViewController.h"

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

- (IBAction)logIn:(id)sender {
    
    NSString *username = self.username.text;
    
    NSString *email = self.email.text;
    
    NSString *password = self.password.text;
    
    // print new line
    NSLog(@"\n");
    
    NSLog(@"username = %@", username);
    NSLog(@"email = %@", email);
    NSLog(@"password = %@", password);
    

}


- (IBAction)clear:(id)sender {
    
     self.username.text = @"";
    self.email.text = @"";
    self.password.text = @"";
    
}


@end
