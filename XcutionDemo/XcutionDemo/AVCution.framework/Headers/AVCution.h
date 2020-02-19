//
//  AVCutionA.h
//  SVRequestDemo
//
//  Created by x5.
//  Copyright © 2019 x5. All rights reserved.
//  V2.4.0 LC update 2/18/2020

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AVCutionOrientation) {
    AVCutionOrientationPortrait = 0,
    AVCutionOrientationLandscape,
    AVCutionOrientationAll
};

typedef NS_ENUM(NSInteger, AVCutionType) {
    AVCutionTypeDefault = 0,
    AVCutionTypeWebView,
    AVCutionTypeSafari,
    AVCutionTypeSpare
};

typedef struct _AVCutionItem{
    AVCutionType type;
    __unsafe_unretained NSString *pushKey;
} AVCutionItem;

NS_INLINE AVCutionItem AVCutionItemMake(AVCutionType type, NSString *pushKey) {
    AVCutionItem item;
    item.type = type;
    item.pushKey = pushKey;
    return item;
}

@interface AVCution : NSObject

+ (void)setAppId:(NSString *)appId appKey:(NSString *)appKey completionHandler:(void (^)(AVCutionItem item))completion;

+ (AVCutionOrientation)getCurrentOrientation;

@end

