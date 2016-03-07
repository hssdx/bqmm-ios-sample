//
//  AppDelegate.m
//  StampMeSDK
//
//  Created by ceo on 8/14/15.
//  Copyright (c) 2015 siyanhui. All rights reserved.
//

#import "AppDelegate.h"
#import "BQMM.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application
        didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIColor *navBarTintColor = [UIColor colorWithRed:24.0/255.0
                                               green:180.0/255.0
                                                blue:237.0/255.0
                                               alpha:1.0];
    [[UINavigationBar appearance] setBarTintColor:navBarTintColor];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[MMEmotionCentre defaultCentre] clearSession];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
