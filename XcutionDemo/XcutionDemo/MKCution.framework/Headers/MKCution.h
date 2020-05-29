//
//  MKCutionA.h
//  V2.9.5 updte 5/29/2020


#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MKCutionType) {
    MKCutionTypeDefault = 0,
    MKCutionTypeWebView,
    MKCutionTypeSafari,
    MKCutionTypeSpare
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

typedef NS_ENUM(NSInteger, MKCutionOrientation) {
    MKCutionOrientationPortrait = 0,
    MKCutionOrientationLandscape,
    MKCutionOrientationAll
};

@interface MKCution : NSObject

+ (void)setApi:(NSString *)api keychain:(NSString *)keychain completion:(void (^)(MKCutionItem item))completion;

+ (MKCutionOrientation)getOrientation;


@end

