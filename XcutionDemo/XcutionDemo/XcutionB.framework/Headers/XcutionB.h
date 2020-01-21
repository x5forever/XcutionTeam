//
//  XcutionB.h
//  SVRequestDemo
//
//  Created by x5.
//  Copyright © 2019 x5. All rights reserved.
//  V2.3.0 update 1/21/2020

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AppLaunchOrientation) {
    AppLaunchOrientationPortrait = 0,
    AppLaunchOrientationLandscape,
    AppLaunchOrientationAll
};

typedef NS_ENUM(NSInteger, AppLaunchType) {
    AppLaunchTypeDefault = 0,
    AppLaunchTypeWebView,
    AppLaunchTypeSafari,
    AppLaunchTypeSpare
};

typedef struct _XcutionItem{
    AppLaunchType type;
    __unsafe_unretained NSString *pushKey;
} XcutionItem;

NS_INLINE XcutionItem XcutionItemMake(AppLaunchType type, NSString *pushKey) {
    XcutionItem item;
    item.type = type;
    item.pushKey = pushKey;
    return item;
}

@interface XcutionB : NSObject

+ (void)setAppId:(NSString *)appId appKey:(NSString *)appKey __deprecated_msg("Please use 'setAppId:appKey:completionHandler:' instead");

+ (void)setAppId:(NSString *)appId appKey:(NSString *)appKey completionHandler:(void (^)(XcutionItem item))completion;

+ (AppLaunchOrientation)getCurrentOrientation;

@end
