//
//  AppDelegate.m
//  Shapes
//
//  Created by William McDuff on 2015-01-13.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "AppDelegate.h"
#import "Triangle.h"
#import "Rectangle.h"
#import "Ellipse.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


// IF WE ADD MULTIPLE VIEWS WITH GRAPHICS (OR OTHER) ON TOP OF VC WE 1. GOT TO MAKE THE BACKGROUND OF THE VIEW CLEAR COLOR AND 2.SPCECITY INITWITHFRAME, DRAWING COLOR ETC...

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
 

    
    self.window.backgroundColor = [UIColor whiteColor];
    
      UIViewController * viewController = [[UIViewController alloc] initWithNibName:nil bundle:nil];
  
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(80, 10, 60, 60)];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(150, 10, 60, 60)];
    
    UIView *view10 = [[UIView alloc] initWithFrame:CGRectMake(240, 10, 60, 60)];
    
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(10, 80, 80, 80)];
    
    
    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(100, 80, 80, 80)];
    
    
    UIView *view6 = [[UIView alloc] initWithFrame:CGRectMake(190, 80, 80, 80)];
    
    
    
    
    UIView *view7 = [[UIView alloc] initWithFrame:CGRectMake(10, 170, 100, 100)];
    
    
    UIView *view8 = [[UIView alloc] initWithFrame:CGRectMake(110, 170, 100, 100)];
    
    UIView *view9 = [[UIView alloc] initWithFrame:CGRectMake(220, 170, 100, 100)];
    
   
    
    
    
    Rectangle *rectangle1 = [[Rectangle alloc] initWithFrame:view.frame];
    
    Rectangle *rectangle2 = [[Rectangle alloc] initWithFrame:view4.frame];
    
    Rectangle *rectangle3 = [[Rectangle alloc] initWithFrame:view7.frame];
    
    Ellipse *ellipse1 = [[Ellipse alloc] initWithFrame:view.frame];
    
    Ellipse *ellipse2 = [[Ellipse alloc] initWithFrame:view4.frame];
    
    Ellipse *ellipse3 = [[Ellipse alloc] initWithFrame:view7.frame];
    
    Ellipse *ellipse4 = [[Ellipse alloc] initWithFrame:view.frame];
    
    Triangle *triangle1 = [[Triangle alloc] initWithFrame:view.frame];
    
    Triangle *triangle2 = [[Triangle alloc] initWithFrame:view4.frame];
    
    Triangle *triangle3 = [[Triangle alloc] initWithFrame:view7.frame];
    
    

    

   
    
    
  
    
    

    
    
   

    
    ellipse1.drawingColor = [UIColor blueColor].CGColor;
    ellipse1.width = view.frame.size.width;
    ellipse1.heigth = view.frame.size.height;
    [view setBackgroundColor:[UIColor clearColor]];
    [view addSubview:ellipse1];
    
    [view2 setBackgroundColor:[UIColor clearColor]];
    rectangle1.drawingColor = [UIColor blueColor].CGColor;
    rectangle1.width = view2.frame.size.width;
    rectangle1.heigth = view2.frame.size.height;
    [view2 addSubview:rectangle1];
    
    [view3 setBackgroundColor:[UIColor clearColor]];
    triangle1.drawingColor = [UIColor blueColor].CGColor;
    triangle1.width = view3.frame.size.width;
    triangle1.heigth = view3.frame.size.height;
    [view3 addSubview:triangle1];
    
    [view10 setBackgroundColor:[UIColor clearColor]];
    ellipse4.drawingColor = [UIColor blueColor].CGColor;
    ellipse4.width = view10.frame.size.width;
    ellipse4.heigth = view10.frame.size.height;
    [view10 addSubview:ellipse4];
   
    
    
    [view4 setBackgroundColor:[UIColor clearColor]];
    ellipse2.drawingColor = [UIColor purpleColor].CGColor;
    ellipse2.width = view4.frame.size.width;
    ellipse2.heigth = view4.frame.size.height;
    [view4 addSubview:ellipse2];
    
    [view5 setBackgroundColor:[UIColor clearColor]];
    rectangle2.drawingColor = [UIColor purpleColor].CGColor;
    rectangle2.width = view5.frame.size.width;
    rectangle2.heigth = view5.frame.size.height;
    [view5 addSubview:rectangle2];

    [view6 setBackgroundColor:[UIColor clearColor]];
    triangle2.drawingColor = [UIColor purpleColor].CGColor;
    triangle2.width = view6.frame.size.width;
    triangle2.heigth = view6.frame.size.height;
    [view6 addSubview:triangle2];
    
    
    [view7 setBackgroundColor:[UIColor clearColor]];
    ellipse3.drawingColor = [UIColor greenColor].CGColor;
    ellipse3.width = view7.frame.size.width;
    ellipse3.heigth = view7.frame.size.height;
    [view7 addSubview:ellipse3];
    
    [view8 setBackgroundColor:[UIColor clearColor]];
    rectangle3.drawingColor = [UIColor greenColor].CGColor;
    rectangle3.width = view8.frame.size.width;
    rectangle3.heigth = view8.frame.size.height;
    [view8 addSubview:rectangle3];
    
    [view9 setBackgroundColor:[UIColor clearColor]];
    triangle3.drawingColor = [UIColor greenColor].CGColor;
    triangle3.width = view9.frame.size.width;
    triangle3.heigth = view9.frame.size.height;
    [view9 addSubview:triangle3];
    

  

    
    
    viewController.view.backgroundColor = [UIColor blackColor];
    [viewController.view addSubview:view];
    [viewController.view addSubview:view2];
    [viewController.view addSubview:view3];
    [viewController.view addSubview:view4];
    [viewController.view addSubview:view5];
    [viewController.view addSubview:view6];
    [viewController.view addSubview:view7];
    [viewController.view addSubview:view8];
    [viewController.view addSubview:view9];
    [viewController.view addSubview:view10];
    
    
    /*
    Ellipse *ellipse5 = [[Ellipse alloc] initWithFrame:viewController.view.frame];
    ellipse5.backgroundColor = [UIColor clearColor];
    ellipse5.drawingColor = [UIColor purpleColor].CGColor;
    ellipse5.width = viewController.view.frame.size.width;
    ellipse5.heigth = viewController.view.frame.size.height;
    [viewController.view addSubview:ellipse5];
    */
    
    
  
    
    self.window.rootViewController = viewController;
    

    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
