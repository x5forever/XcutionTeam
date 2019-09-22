//
//  AppDelegate+init.m
//
//  Created by x5 on 2017/11/3.
//  Copyright © 2017年 Xcution. All rights reserved.
//

#import "AppDelegate+init.h"
#import <XcutionA/XcutionA.h>
#import "JPUSHService.h"

// channelId
static NSString *kSVChannelId = @"";
// SVRequest
static NSString *kXcutionAAppID = @"";
static NSString *kXcutionAAppKey = @"";
// JPush
static NSString *kJPushAppKey = @"";
#ifdef DEBUG
static BOOL isProduction = FALSE;
#else
static BOOL isProduction = TRUE;
#endif

@interface AppDelegate ()<JPUSHRegisterDelegate>
@end

@implementation AppDelegate (init)

- (void)registerXAPushWithOption:(NSDictionary *)launchOptions {
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    [XcutionA setAppId:kXcutionAAppID appKey:kXcutionAAppKey];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    [JPUSHService setupWithOption:launchOptions appKey:kJPushAppKey
                          channel:kSVChannelId
                 apsForProduction:isProduction
            advertisingIdentifier:nil];
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
@end
