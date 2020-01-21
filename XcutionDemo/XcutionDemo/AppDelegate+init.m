//
//  AppDelegate+init.m
//
//  Created by x5 on 2017/11/3.
//  Copyright © 2017年 Xcution. All rights reserved.
//

#import "AppDelegate+init.h"
#import <XcutionA/XcutionA.h>
#import "JPUSHService.h"

// XcutionA V2.3.0
static NSString *kXcutionAppID = @"";
static NSString *kXcutionAppKey = @"";

@interface AppDelegate ()<JPUSHRegisterDelegate>
@end

@implementation AppDelegate (init)

- (void)registerAppPushWithOption:(NSDictionary *)launchOptions {
    [XcutionA setAppId:kXcutionAppID appKey:kXcutionAppKey completionHandler:^(XcutionItem item) {
    if (item.pushKey.length) {
        JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
        [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
        [JPUSHService setupWithOption:launchOptions appKey:item.pushKey
                              channel:xcuAChannel()
                     apsForProduction:TRUE
                advertisingIdentifier:nil];
    }}];
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [JPUSHService registerDeviceToken:deviceToken];
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    [application setApplicationIconBadgeNumber:0];
    [application cancelAllLocalNotifications];
}
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    AppLaunchOrientation orientation= [XcutionA getCurrentOrientation];
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
static inline NSString * xcuAChannel() {
    NSString *appNameKey = @"CFBundleDisplayName";
    NSString *appName = [NSBundle mainBundle].infoDictionary[appNameKey];
    return appName.length ? appName : @"";
}
@end
