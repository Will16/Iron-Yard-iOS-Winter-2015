//
//  ChoiceViewController.h
//  ScribbleTouch
//
//  Created by William McDuff on 2015-01-15.
//  Copyright (c) 2015 Jo Albright. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  ChoiceViewControllerDelegate;



@interface ChoiceViewController : UIViewController

// choices the different blend modes, or shape types
@property (nonatomic) NSArray *choices;

// group: shapetype or blendmode
@property (nonatomic) NSString* group;
@property (nonatomic, assign) id <ChoiceViewControllerDelegate> delegate;

@end


@protocol ChoiceViewControllerDelegate <NSObject>

- (void) choice:(NSString *)choice forGroup:(NSString *)group;


@end