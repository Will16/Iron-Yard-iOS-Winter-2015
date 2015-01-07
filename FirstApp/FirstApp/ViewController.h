//
//  ViewController.h
//  FirstApp
//
//  Created by William McDuff on 2015-01-05.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController






@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

// returns an IBAction, an the parameter is id (anyObject)  (the sender (what is the object that is trigerring the method)
- (IBAction)bigButtonPressed:(id)sender;


@end

