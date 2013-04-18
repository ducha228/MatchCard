//
//  AppDelegate.m
//  FootballTabbar
//
//  Created by DucHa on 4/18/13.
//  Copyright (c) 2013 DucHa. All rights reserved.
//

#import "AppDelegate.h"

#import "PlayerViewController.h"
#import "AllClubViewController.h"
#import "ScheduleViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    PlayerViewController *playerVC = [[PlayerViewController alloc] initWithNibName:@"PlayerViewController" bundle:nil];
    AllClubViewController *clubVC = [[AllClubViewController alloc] initWithNibName:@"AllClubViewController" bundle:nil];
    ScheduleViewController *scheduleVC = [[ScheduleViewController alloc] initWithNibName:@"ScheduleViewController" bundle:nil];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:playerVC];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:clubVC];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:scheduleVC];
    nav1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Player" image:[UIImage imageNamed:@""] tag:1];
    nav2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Club" image:[UIImage imageNamed:@""] tag:2];
    nav3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Schedule" image:[UIImage imageNamed:@""] tag:3];
    tabBarController.viewControllers =  @[nav1, nav2, nav3];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
