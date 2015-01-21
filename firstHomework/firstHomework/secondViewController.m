//
//  secondViewController.m
//  firstHomework
//
//  Created by William McDuff on 2015-01-05.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

// 600 by 600

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blueButton.layer.masksToBounds = true;
    self.blueButton.layer.cornerRadius = self.blueButton.frame.size.height/2;
    
    self.greenButton.layer.masksToBounds = true;
    self.greenButton.layer.cornerRadius = self.greenButton.frame.size.height/2;
    
    self.yellowButton.layer.masksToBounds = true;
    self.yellowButton.layer.cornerRadius = self.yellowButton.frame.size.height/2;
    
    self.redButton.layer.masksToBounds = true;
    self.redButton.layer.cornerRadius = self.redButton.frame.size.height/2;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonClicked:(id)sender {
    
    if ([sender isEqual:self.blueButton]) {
        self.view.backgroundColor = [UIColor blueColor];
    }
    
    if ([sender isEqual:self.greenButton]) {
        self.view.backgroundColor = [UIColor greenColor];
    }
    
    if ([sender isEqual:self.redButton]) {
        self.view.backgroundColor = [UIColor redColor];
    }
    
    if ([sender isEqual:self.yellowButton]){
        self.view.backgroundColor = [UIColor yellowColor];
    }


}
@end
