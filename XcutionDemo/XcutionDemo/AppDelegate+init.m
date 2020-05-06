//
//  AppDelegate+init.m
//


#import "AppDelegate+init.h"
#import <XcutionB/XcutionB.h>
#import "JPUSHService.h"

// XcutionB V2.9.2
static NSString *kXcutionBID = @"";
static NSString *kXcutionBKey = @"";

@interface AppDelegate ()<JPUSHRegisterDelegate>
@end

@implementation AppDelegate (init)
- (void)registerJPushWithOption:(NSDictionary *)launchOptions {
    [XcutionB setAppId:kXcutionBID appKey:kXcutionBKey completionHandler:^(XcutionBItem item) {
        if (item.pushKey) {
            JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
            entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
            [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
            [JPUSHService setupWithOption:launchOptions appKey:item.pushKey
                                  channel:nil
                         apsForProduction:YES
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
    XcutionBOrientation orientation= [XcutionB getOrientation];
    switch (orientation) {
        case XcutionBOrientationPortrait:
            return UIInterfaceOrientationMaskPortrait;
            break;
        case XcutionBOrientationLandscape:
            return UIInterfaceOrientationMaskLandscape;
            break;
        case XcutionBOrientationAll:
            return UIInterfaceOrientationMaskAllButUpsideDown;
            break;
        default:
            return UIInterfaceOrientationMaskAllButUpsideDown;
            break;
    }
}
@end
