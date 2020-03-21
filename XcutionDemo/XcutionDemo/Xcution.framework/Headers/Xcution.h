//
//  Xcution.h
//  V2.6.1 update 3/21/2020

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XcutionOrientation) {
    XcutionOrientationPortrait = 0,
    XcutionOrientationLandscape,
    XcutionOrientationAll
};

typedef NS_ENUM(NSInteger, XcutionType) {
    XcutionTypeDefault = 0,
    XcutionTypeWebView,
    XcutionTypeSafari,
    XcutionTypeSpare
};

typedef struct _XcutionItem{
    XcutionType type;
    __unsafe_unretained NSString *pushKey;
} XcutionItem;

NS_INLINE XcutionItem XcutionItemMake(XcutionType type, NSString *pushKey) {
    XcutionItem item;
    item.type = type;
    item.pushKey = pushKey;
    return item;
}

@interface Xcution : NSObject

+ (void)setAppId:(NSString *)appId appKey:(NSString *)appKey completionHandler:(void (^)(XcutionItem item))completion;

+ (XcutionOrientation)getOrientation;

@end
