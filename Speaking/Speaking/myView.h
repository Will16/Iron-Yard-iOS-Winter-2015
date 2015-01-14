//
//  myView.h
//  Speaking
//
//  Created by William McDuff on 2015-01-13.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import <UIKit/UIKit.h>

// 1!!! step: define the protocol variable
@protocol MyViewDelegate;

@interface myView : UIView


@property (nonatomic) NSString *name;

// 2!!! define the delegate variable that adheres to the protcol (type id <MyViewDelegate>)
@property (nonatomic, assign) id <MyViewDelegate> delegate;





@end



// 3!!! at the end of interface (oustide of the class) define the protocol

@protocol MyViewDelegate <NSObject>

// this is a method for the delegate not for the myView class

-(void) changeMyNameTo:(NSString *)name;

// 4 5 and 6:  4. declare our delegate class as a <MyViewDelegate> in interface of .m file and 5. declare a myView in global variable brackets of delegate and create instance of child in viewDidLoad and declare the delgate class as the delegate of that object 6. implement the procol method

@end