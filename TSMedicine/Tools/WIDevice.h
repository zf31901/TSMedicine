//
//  SSDevice.h
//  LimitFree


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WIDevice : NSObject

+ (float) getOSVersion;
+ (float) getScreenWidth;
+ (float) getScreenHeight;
+ (NSString *) getIPhoneName;
+ (float) getNavHeight;

//是否是1136屏
+ (BOOL)Is1136;

@end

//自动适配数值
#define Value ([UIScreen mainScreen].bounds.size.height/568)
#define Twenty  (isIOS7 ? 20.0 : 0.0)
#define Twenty6 (isIOS7 ? 0.0 : 20.0)

//#define NavHeight 64
//#define DockHeight 91
//#define NavHeight ([WIDevice getNavHeight])

#define ScreenWidth  [WIDevice getScreenWidth]
#define ScreenHeight [WIDevice getScreenHeight]
#define kOSVersion    [WIDevice getOSVersion]

#define isIOS7        ([WIDevice getOSVersion] >= 7)
#define is1136 ([WIDevice Is1136])

//唯一标示符
#define UUID [[[UIDevice currentDevice] identifierForVendor] UUIDString]









