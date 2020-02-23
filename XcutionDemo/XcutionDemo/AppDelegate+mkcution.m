//
//  AppDelegate+mkcution.m
//


#import "AppDelegate+mkcution.h"
#import <MKCution/MKCution.h>
#import "JPUSHService.h"

// MKCution V2.4.1
static NSString *kMKCutionAPI = @"";

@interface AppDelegate ()<JPUSHRegisterDelegate>
@end

@implementation AppDelegate (mkcution)

- (void)registerMKPushWithOption:(NSDictionary *)launchOptions {
    [MKCution setApi:kMKCutionAPI completionHandler:^(MKCutionItem item) {
        if (item.pushKey.length) {
            JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
            entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
            [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
            [JPUSHService setupWithOption:launchOptions appKey:item.pushKey
                                  channel:avAppName()
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
    MKCutionOrientation orientation= [MKCution getCurrentOrientation];
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
static inline NSString * avAppName() {
    NSString *appNameKey = @"CFBundleDisplayName";
    NSString *appName = [NSBundle mainBundle].infoDictionary[appNameKey];
    return appName.length ? appName : @"";
}
@end
