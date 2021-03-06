//
//  AppDelegate.m
//  TimeConnect
//
//  Created by Le, Huy on 5/30/14.
//  Copyright (c) 2014 Cambridge Interns. All rights reserved.
//

#import "AppDelegate.h"
#import "Parse/Parse.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
     //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
     //self.window.backgroundColor = [UIColor whiteColor];
     //[self.window makeKeyAndVisible];
    
    //Google Map API
    [GMSServices provideAPIKey:@"AIzaSyAfnFOR93oElN1Wet70HsXu8suJP3_517w"];
    
    //Establish Parse connection
    [Parse setApplicationId:@"VHJSk9hmfDIoXsrRE3V7KWM6KHkncJwYfslUp10A"
                  clientKey:@"jxEXtvJwz6Ey1BiH8gEX4TibuOfThpUbYTtV82x8"];
    
    //Remote notificiations (these lines are for push notificiations)
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|
                                                    UIRemoteNotificationTypeAlert|
                                                    UIRemoteNotificationTypeSound];
    
    //Tracks stats around application when opened
    
    //Test table viewer in application
    
    /*UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UINavigationController *navigationController = [tabBarController viewControllers][0];
    */
    
   // testTableViewController.query = [PFQuery queryWithClassName:@"TimeSheet"];
    //testTableViewController.query = _query;
    
    
    
    return YES;
}

- (void) viewDidLoad{
    
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

//Store the device token and handle the UI for notifications (PUSH NOTIFICATIONS)

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}

@end
