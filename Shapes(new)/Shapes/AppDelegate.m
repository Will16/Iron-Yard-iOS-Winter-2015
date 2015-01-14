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
  

    viewController.view.backgroundColor = [UIColor blackColor];
    
    Rectangle *rectangle1 = [[Rectangle alloc] initWithFrame:viewController.view.frame];
    rectangle1.backgroundColor = [UIColor clearColor];
    rectangle1.drawingColor = [UIColor blueColor].CGColor;
    [viewController.view addSubview:rectangle1];

    
    Rectangle *rectangle2 = [[Rectangle alloc] initWithFrame:viewController.view.frame];
     rectangle2.backgroundColor = [UIColor clearColor];
    rectangle2.drawingColor = [UIColor blueColor].CGColor;
    [viewController.view addSubview:rectangle2];
    
    Rectangle *rectangle3 = [[Rectangle alloc] initWithFrame:viewController.view.frame];
    rectangle3.backgroundColor = [UIColor clearColor];
    rectangle3.drawingColor = [UIColor blueColor].CGColor;
    [viewController.view addSubview:rectangle3];
    
    Ellipse *ellipse1 = [[Ellipse alloc] initWithFrame:viewController.view.frame];
    ellipse1.backgroundColor = [UIColor clearColor];
    ellipse1.drawingColor = [UIColor blueColor].CGColor;
    [viewController.view addSubview:ellipse1];
    
    Ellipse *ellipse2 = [[Ellipse alloc] initWithFrame:viewController.view.frame];
    ellipse2.backgroundColor = [UIColor clearColor];
    ellipse2.drawingColor = [UIColor blueColor].CGColor;
    [viewController.view addSubview:ellipse2];
    
    Ellipse *ellipse3 = [[Ellipse alloc] initWithFrame:viewController.view.frame];
    ellipse3.backgroundColor = [UIColor clearColor];
    ellipse3.drawingColor = [UIColor blueColor].CGColor;
    [viewController.view addSubview:ellipse3];
    
    Ellipse *ellipse4 = [[Ellipse alloc] initWithFrame:viewController.view.frame];
    
    Triangle *triangle1 = [[Triangle alloc] initWithFrame:viewController.view.frame];
    
    Triangle *triangle2 = [[Triangle alloc] initWithFrame:viewController.view.frame];
    
    Triangle *triangle3 = [[Triangle alloc] initWithFrame:viewController.view.frame];
    

  
    
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
