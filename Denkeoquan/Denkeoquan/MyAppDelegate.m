//
//  MyAppDelegate.m
//  Denkeoquan
//
//  Created by DucHa on 4/25/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "MyAppDelegate.h"
#import "ViewController.h"

@implementation MyAppDelegate

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    window = [[UIWindow alloc] init];
    window.screen = [UIScreen mainScreen];
    viewController = [[ViewController alloc] init];
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    return YES;
}

@end
