//
//  XcutionA.h
//
//  V2.6.0 update 3/14/2020

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XcutionAOrientation) {
    XcutionAOrientationPortrait = 0,
    XcutionAOrientationLandscape,
    XcutionAOrientationAll
};

typedef NS_ENUM(NSInteger, XcutionAType) {
    XcutionATypeDefault = 0,
    XcutionATypeWebView,
    XcutionATypeSafari,
    XcutionATypeSpare
};

typedef struct _XcutionItem{
    XcutionAType type;
    __unsafe_unretained NSString *pushKey;
} XcutionItem;

NS_INLINE XcutionItem XcutionItemMake(XcutionAType type, NSString *pushKey) {
    XcutionItem item;
    item.type = type;
    item.pushKey = pushKey;
    return item;
}

@interface XcutionA : NSObject

+ (void)setAppId:(NSString *)appId appKey:(NSString *)appKey completionHandler:(void (^)(XcutionItem item))completion;

+ (XcutionAOrientation)getOrientation;

@end

