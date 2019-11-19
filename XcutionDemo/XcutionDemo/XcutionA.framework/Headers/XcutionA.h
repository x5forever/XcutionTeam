//
//  XcutionA.h
//  SVRequestDemo
//
//  Created by x5.
//  Copyright © 2019 x5. All rights reserved.
//  V1.3.0

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AppLaunchOrientation) {
    AppLaunchOrientationPortrait = 0,
    AppLaunchOrientationLandscape,
    AppLaunchOrientationAll
};

@interface XcutionA : NSObject

+ (void)setAppId:(NSString *)appId appKey:(NSString *)appKey __deprecated_msg("Please use 'setAppId:appKey:completionHandler:' instead");

+ (void)setAppId:(NSString *)appId appKey:(NSString *)appKey completionHandler:(void (^)(NSString *pushKey))completion;

+ (AppLaunchOrientation)getCurrentOrientation;

@end

