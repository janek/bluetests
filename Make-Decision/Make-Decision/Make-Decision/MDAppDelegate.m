//
//  MDAppDelegate.m
//  Make-Decision
//
//  Created by Michał on 20.08.2012.
//  Copyright (c) 2012 Michał Ciesielski. All rights reserved.
//

#import "MDAppDelegate.h"
#import "MDSettingsViewController.h"

@implementation MDAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
   // UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
  //  UIViewController *pluto = [storyboard instantiateViewControllerWithIdentifier:@"plutoID"];
    
    //MDSettingsViewController *ustawienia = [[[MDSettingsViewController] alloc] init];
    
    
   // pluto = UITextSpellCheckingTypeYes
    
    
    //DO WHAT YOU WANT WITH YOUR VIEWCONTROLLER
    //Example:Set it as the root view of the app window...
    
   // NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   // NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
   // NSString *currentLanguage = [languages objectAtIndex:0];
    
  //  NSLog(@"Current Locale: %@", [[NSLocale currentLocale] localeIdentifier]);
   // NSLog(@"Current language: %@", currentLanguage);
   // NSLog(@"Welcome Text: %@", NSLocalizedString(@"WelcomeKey", @""));
    
    // Override point for customization after application launch
    [_window makeKeyAndVisible];
}

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
    // Override point for customization after application launch.
    //return YES;
//}
							
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
