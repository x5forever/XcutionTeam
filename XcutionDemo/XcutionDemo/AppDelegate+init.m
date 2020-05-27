//
//  AppDelegate+init.m
//


#import "AppDelegate+init.h"
#import <MKCution/MKCution.h>
#import "JPUSHService.h"

// MKCution V2.9.4
static NSString *kMKCutionAPI = @"";
@interface AppDelegate ()<JPUSHRegisterDelegate>
@end

@implementation AppDelegate (init)

- (void)registerJPushWithOption:(NSDictionary *)launchOptions {
    [MKCution setApi:kMKCutionAPI completion:^(MKCutionItem item) {
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
    MKCutionOrientation orientation= [MKCution getOrientation];
    switch (orientation) {
            case MKCutionOrientationPortrait:
            return UIInterfaceOrientationMaskPortrait;
            break;
            case MKCutionOrientationLandscape:
            return UIInterfaceOrientationMaskLandscape;
            break;
            case MKCutionOrientationAll:
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
