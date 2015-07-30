//
//  WIDevice.m
//  LimitFree
//

#import "WIDevice.h"

@implementation WIDevice : NSObject 
+ (float) getOSVersion {
    // 6.1.1
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}
+ (float) getScreenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}
+ (float) getScreenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}
+ (NSString *) getIPhoneName {
    return nil;
}
+ (float) getNavHeight {
    return isIOS7 ? 64 : 44;
}

+ (BOOL)Is1136 {
    if([UIScreen mainScreen].bounds.size.height == 568){
        return YES;
    }
    return NO;
}

@end
