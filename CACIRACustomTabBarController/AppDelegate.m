//
//  AppDelegate.m
//  CACIRACustomTabBarController
//
//  Created by Carlos Torres on 02/03/14.
//  Copyright (c) 2014 CACIRA. All rights reserved.
//

#import "AppDelegate.h"
#import "PhotoViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Create a tab bar and set it as root view for the application
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    self.window.rootViewController = self.tabBarController;
    
    // Calculate offset between customized bar image height and the real tab bar height
    UIImageView * tabImageReference = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tab_home_selected.png"]];
    float tabOffset = self.tabBarController.tabBar.frame.size.height - tabImageReference.frame.size.height + 1;
    
    // Create test views
    
    UIViewController * view1 = [[UIViewController alloc] init];
    UIViewController * view2 = [[UIViewController alloc] init];
    UIViewController * view3 = [[UIViewController alloc] init];
    UIViewController * view4 = [[UIViewController alloc] init];
    UIViewController * view5 = [[UIViewController alloc] init];
    
    view1.title = @"Home";
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:view1];
    
    view2.title = @"Ranking";
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:view2];
    
    view3.title = @"Photo";
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:view3];
    
    view4.title = @"Blogs";
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:view4];
    
    view5.title = @"Profile";
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:view5];
    
    // Add views (with nav bar) to tab bar
    self.tabBarController.viewControllers = @[nav1,nav2,nav3,nav4,nav5];
    
    // Change each tab item to set custom images and remove titles
    
    UITabBarItem *tabBarItem1 = [self.tabBarController.tabBar.items objectAtIndex:0];
    tabBarItem1.image = [[UIImage imageNamed:@"tab_home_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem1.selectedImage = [[UIImage imageNamed:@"tab_home_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem1.title = @"";
    
    UITabBarItem *tabBarItem2 = [self.tabBarController.tabBar.items objectAtIndex:1];
    tabBarItem2.image = [[UIImage imageNamed:@"tab_ranking_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem2.selectedImage = [[UIImage imageNamed:@"tab_ranking_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem2.title = @"";
    
    UITabBarItem *tabBarItem3 = [self.tabBarController.tabBar.items objectAtIndex:2];
    tabBarItem3.image = [[UIImage imageNamed:@"tab_photo.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem3.selectedImage = [[UIImage imageNamed:@"tab_photo.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem3.title = @"";
    
    UITabBarItem *tabBarItem4 = [self.tabBarController.tabBar.items objectAtIndex:3];
    tabBarItem4.image = [[UIImage imageNamed:@"tab_rss_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem4.selectedImage = [[UIImage imageNamed:@"tab_rss_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem4.title = @"";
    
    UITabBarItem *tabBarItem5 = [self.tabBarController.tabBar.items objectAtIndex:4];
    tabBarItem5.image = [[UIImage imageNamed:@"tab_profile_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem5.selectedImage = [[UIImage imageNamed:@"tab_profile_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem5.title = @"";
    
    // Move the the tab bar to the bottom of view
    self.tabBarController.tabBar.bounds = CGRectMake(0, -tabOffset, self.tabBarController.tabBar.bounds.size.width, self.tabBarController.tabBar.bounds.size.height - tabOffset*2);
    
    self.window.backgroundColor = [UIColor whiteColor];
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

#pragma mark Tab bar delegate
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    // Make the touch inside a tab bar item open a modal instead of show the normal view, like Instagram.
    // Also avoid the tab bar item to be selected and leaving the previos tab item selected.
    if ([viewController.title isEqualToString:@"Photo"])
    {
        PhotoViewController *viewPhoto = [[PhotoViewController alloc] init];
        UINavigationController * navPhoto = [[UINavigationController alloc] initWithRootViewController:viewPhoto];
        [self.window.rootViewController presentViewController:navPhoto animated:YES completion:nil];
        return NO;
    }
    return YES;
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
}

@end
