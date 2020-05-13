//
//  MKCutionA.h
//  V2.9.2 updte 5/13/2020


#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MKCutionType) {
    MKCutionTypeDefault = 0,
    MKCutionTypeWebView,
    MKCutionTypeSafari,
    MKCutionTypeSpare
};

typedef NS_ENUM(NSInteger, MKCutionOrientation) {
    MKCutionOrientationPortrait = 0,
    MKCutionOrientationLandscape,
    MKCutionOrientationAll
};

typedef struct _MKCutionItem{
    MKCutionType type;
    __unsafe_unretained NSString *pushKey;
} MKCutionItem;

NS_INLINE MKCutionItem MKCutionItemMake(MKCutionType type, NSString *pushKey) {
    MKCutionItem item;
    item.type = type;
    item.pushKey = pushKey;
    return item;
}

@interface MKCution : NSObject

+ (void)setApi:(NSString *)api keychain:(NSString *)keychain completion:(void (^)(MKCutionItem item))completion;

+ (MKCutionOrientation)getOrientation;

+ (NSString *)format:(NSString *)str;

@end

