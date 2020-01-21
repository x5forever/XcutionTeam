//
//  AppDelegate.m
//  XcutionDemo
//
//  Created by x5 on 2019/5/13.
//  Copyright © 2019 x5. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "AppDelegate+init.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    self.window.rootViewController = [ViewController new];
    [self.window makeKeyAndVisible];
    [self registerAppPushWithOption:launchOptions];
    return YES;
}


@end
