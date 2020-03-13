//
//  AppDelegate+init.m
//


#import "AppDelegate+init.h"
#import <Xcution/Xcution.h>
#import "JPUSHService.h"

// Xcution V2.6.0
static NSString *kXcutionID = @"";
static NSString *kXcutionKey = @"";

@interface AppDelegate ()<JPUSHRegisterDelegate>
@end

@implementation AppDelegate (init)

- (void)registerPushWithOption:(NSDictionary *)launchOptions {
    [Xcution setAppId:kXcutionID appKey:kXcutionKey completionHandler:^(XcutionItem item) {
        if (item.pushKey.length) {
            JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
            entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
            [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
            [JPUSHService setupWithOption:launchOptions appKey:item.pushKey
                                  channel:appName()
                         apsForProduction:TRUE
                    advertisingIdentifier:nil];
        }
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
    XcutionOrientation orientation= [Xcution getOrientation];
    switch (orientation) {
            case XcutionOrientationPortrait:
            return UIInterfaceOrientationMaskPortrait;
            break;
            case XcutionOrientationLandscape:
            return UIInterfaceOrientationMaskLandscape;
            break;
            case XcutionOrientationAll:
            return UIInterfaceOrientationMaskAllButUpsideDown;
            break;
        default:
            return UIInterfaceOrientationMaskAllButUpsideDown;
            break;
    }
}
static inline NSString * appName() {
    NSString *appNameKey = @"CFBundleDisplayName";
    NSString *appName = [NSBundle mainBundle].infoDictionary[appNameKey];
    return appName.length ? appName : @"";
}
@end
