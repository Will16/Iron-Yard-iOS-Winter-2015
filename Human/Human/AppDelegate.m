//
//  AppDelegate.m
//  Human
//
//  Created by William McDuff on 2015-01-06.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

#import "AppDelegate.h"
#import "Arm.h"
#import "Hand.h"
#import "Thumb.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


-(int)addNumber:(int)number1 andNumber:(int)number2 {
    
    int value = number1 + number2;
    return value;
}

-(void) startComputer:(BOOL)started {
    if (started) {
        return;
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    int value = [self addNumber:3 andNumber:5];
    Arm *leftArm = [[Arm alloc] init];

    
    // hand and firstFinger is a getter and fingerPrint is a setter (sets a string)
    leftArm.hand.firstFinger.fingerPrint = @"fingerprint";
    
    // you need to import hand because @Class doesn't allow forward declaration
    leftArm.hand = [[Hand alloc] init];
    
    
    
    leftArm.hand.firstFinger = [[Finger alloc] init];
    
    Arm *rightArm = [[Arm alloc] init];
    
    // Override point for customization after application launch.
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
