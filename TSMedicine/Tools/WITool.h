//
//  WITool.h
//  WITool
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h> // Need to import for CC_MD5 access

typedef void(^SSDownloadImageFinishBlock)(UIImage *image);

@interface WITool : NSObject

//应用window
+ (UIWindow *)appWindow;

//剪切图片
+ (UIImage *)cutImage:(UIImage *)image withRect:(CGRect)rect;

//压缩图片
+ (UIImage *)scaleImage:(UIImage *)image withSize:(CGSize)size;

//隐藏所有键盘
+ (void)hideAllKeyBoard;

//第一响应者
+ (UIView *)firstResponder;

//秒转化时分秒
+ (NSString *)durationStringWithSeconds:(int)seconds;

// 得到当前时间
+ (NSString *)getTime;

// 时间戳转日期
+ (NSString *)dateformatter:(NSString *)str;

// 时间戳转日期
+ (NSString *)dateformatterYear:(NSString *)str;

// 得到状态栏
+ (UIView *)getStatusbarView;

//判断是否为空
+ (BOOL)isNull:(id)obj;

// 得到view所属viewController
+ (UIViewController *)findViewControllerWithView:(UIView *)view;

// 得到文字长和宽
+ (CGSize)getCGSzieWithText:(NSString *)text width:(float)maxwidth height:(float)maxheight font:(float)font;

// UIColor转UIImage
+ (UIImage *)createImageWithColor:(UIColor *)color;

// 截屏
+ (UIImage *)getScreenImage:(UIView *)view;

// 下载单张图片
+ (void)downloadImageWithUrl:(NSString *)url complete:(SSDownloadImageFinishBlock)finish;

// 去除文本中html标签
+ (NSString *)deleteHTML:(NSString *)html;

// 判断是否为浮点
+ (BOOL)isPureFloat:(NSString *)string;

// 邮箱验证
+ (BOOL)isValidateEmail:(NSString *)email;

// 手机号码验证
+ (BOOL)isValidateMobile:(NSString *)mobile;

@end











