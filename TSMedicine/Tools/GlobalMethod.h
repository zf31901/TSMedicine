//
//  GlobalMethod.h
//  EwtStores
//
//  Created by Harry on 13-11-30.
//  Copyright (c) 2013年 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UserObj.h"

#define UserInfoData [GlobalMethod getUserObj]

@interface GlobalMethod : NSObject

+ (GlobalMethod *)sharedInstance;

// UI快速生成
+ (UIView *)      BuildViewWithFrame:(CGRect )frame NeedCorner:(float)corner;
+ (UIButton *)    BuildButtonWithFrame:(CGRect )frame andOffImg:(NSString *)offImg andOnImg:(NSString *)onImg withTitle:(NSString *)title;
+ (UILabel *)     BuildLableWithFrame:(CGRect )frame withFont:(UIFont *)font withText:(NSString *)text;
+ (UITextField *) BuildTextFieldWithFrame:(CGRect )frame andPlaceholder:(NSString *)placeholder;

// ios6_7 界面适配
+ (CGRect ) AdapterIOS6_7ByIOS6Frame:(CGRect )frame;
+ (CGFloat )AdapterIOS6_7ByIOS6Float:(CGFloat )initial_y;

// 本地保存读取数据
+ (void)saveObject:(id)obj withKey:(NSString *)key;
+ (id)getObjectForKey:(NSString *)key;

//用户数据解归档
+ (UserObj *)getUserObj;

//登录状态
+ (void)saveLoginInStatus:(BOOL)isSignIn;
+ (BOOL)loginInStatus;

@property (nonatomic,assign) BOOL isLogin;


//处理时间戳和时间
+ (NSString *)getJsonDateString:(NSString *)JsonString;                 //"Date(xxxxx)" 转换成 "xxxxx"
+ (NSArray *)getTimeArrByTimeInterval:(NSString *)timeInterval;         //时间戳转 时间数组
+ (NSString *)getDateAndTimeArrByTimeInterval:(NSString *)timeInterval; //时间戳转 日期时间(yyyy/MM/dd hh:mm:ss)
+ (NSString *)getTimeByTimeInterval:(NSString *)timeInterval;           //时间戳转 日期(yyyy-MM-dd)
+ (NSArray *)getTimeDifferenceByBeginTimeInterval:(NSString *)beginT
                              withEndTimeInterval:(NSString *)endT;



//字节数组转int
+(int) byteArrayToInt:(NSRange) range withData:(NSData *)data;

//字节数组转nsstring
//+(NSString *) byteArrayToString:(NSRange) range data:(NSData *)data;
+(NSString *) byteArrayToString2:(NSRange) range data:(NSData *)data;
+ (NSString *)convertJsonDateToIOSDate:(NSString *)jsonDate;
//MD5转换
+ (NSString *)md5:(NSString *)str;

@end


//对UIView方法进行扩充
@interface UIView (Extend)

- (float)top;
- (float)bottom;
- (float)left;
- (float)right;
- (float)width;
- (float)height;

- (void)setExclusiveTouchView:(UIView *)view;

@end
