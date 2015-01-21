//
//  secondViewController.h
//  firstHomework
//
//  Created by William McDuff on 2015-01-05.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface secondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *blueButton;

@property (weak, nonatomic) IBOutlet UIButton *greenButton;

@property (weak, nonatomic) IBOutlet UIButton *yellowButton;

@property (weak, nonatomic) IBOutlet UIButton *redButton;


- (IBAction)buttonClicked:(id)sender;

@end
