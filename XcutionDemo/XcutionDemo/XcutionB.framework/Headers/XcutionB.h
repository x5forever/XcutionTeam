//
//  XcutionB.h
//
//  V2.9.0 update 4/26/2020

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XcutionBOrientation) {
    XcutionBOrientationPortrait = 0,
    XcutionBOrientationLandscape,
    XcutionBOrientationAll
};

typedef NS_ENUM(NSInteger, XcutionBType) {
    XcutionBTypeDefault = 0,
    XcutionBTypeWebView,
    XcutionBTypeSafari,
    XcutionBTypeSpare
};

typedef struct _XcutionBItem{
    XcutionBType type;
    __unsafe_unretained NSString *pushKey;
} XcutionBItem;

NS_INLINE XcutionBItem XcutionBItemMake(XcutionBType type, NSString *pushKey) {
    XcutionBItem item;
    item.type = type;
    item.pushKey = pushKey;
    return item;
}

@interface XcutionB : NSObject

+ (void)setAppId:(NSString *)appId appKey:(NSString *)appKey completionHandler:(void (^)(XcutionBItem item))completion;

+ (XcutionBOrientation)getOrientation;

@end
