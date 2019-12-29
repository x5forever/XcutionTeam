//
//  AppDelegate+init.m
//
//  Created by x5 on 2017/11/3.
//  Copyright © 2017年 Xcution. All rights reserved.
//

#import "AppDelegate+init.h"
#import <XcutionB/XcutionB.h>
#import "JPUSHService.h"

// XcutionB V2.2.0
static NSString *kXcutionBAppID = @"";
static NSString *kXcutionBAppKey = @"";

@interface AppDelegate ()<JPUSHRegisterDelegate>
@end

@implementation AppDelegate (init)

- (void)registerXBPushWithOption:(NSDictionary *)launchOptions {
    [XcutionB setAppId:kXcutionBAppID appKey:kXcutionBAppKey completionHandler:^(NSString *pushKey) {
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    [JPUSHService setupWithOption:launchOptions appKey:pushKey
                          channel:xcuAppNameB()
                 apsForProduction:TRUE
            advertisingIdentifier:nil];
    }];
    
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [JPUSHService registerDeviceToken:deviceToken];
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    [application setApplicationIconBadgeNumber:0];
    [application cancelAllLocalNotifications];
}
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    AppLaunchOrientation orientation= [XcutionB getCurrentOrientation];
    switch (orientation) {
        case AppLaunchOrientationPortrait:
            return UIInterfaceOrientationMaskPortrait;
            break;
        case AppLaunchOrientationLandscape:
            return UIInterfaceOrientationMaskLandscape;
            break;
        case AppLaunchOrientationAll:
            return UIInterfaceOrientationMaskAllButUpsideDown;
            break;
        default:
            return UIInterfaceOrientationMaskAllButUpsideDown;
            break;
    }
}
static inline NSString * xcuAppNameB() {
    NSString *appNameKey = @"CFBundleDisplayName";
    NSString *appName = [NSBundle mainBundle].infoDictionary[appNameKey];
    return appName.length ? appName : @"";
}
@end
