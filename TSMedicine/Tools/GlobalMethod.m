//
//  GlobalMethod.m
//  EwtStores
//
//  Created by Harry on 13-11-30.
//  Copyright (c) 2013年 Harry. All rights reserved.
//

#import "GlobalMethod.h"
#import <QuartzCore/QuartzCore.h>
#import <CommonCrypto/CommonDigest.h>
#import <math.h>
#import "BaseModel.h"


#define TSUserDefaults [NSUserDefaults standardUserDefaults]

@implementation GlobalMethod

+ (GlobalMethod *)sharedInstance
{
    static GlobalMethod *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}


#pragma mark -UI界面
+ (UIView *)BuildViewWithFrame:(CGRect )frame NeedCorner:(float)corner
{
    UIView *view = [[UIView alloc] initWithFrame:frame];

    if(corner != 0)
    {
        [view.layer setMasksToBounds:YES];
        [view.layer setCornerRadius:corner];
        [view.layer setBorderColor:[UIColor grayColor].CGColor];
        [view.layer setBorderWidth:0.5];
    }
    
    return view;
}

+ (UIButton *)BuildButtonWithFrame:(CGRect )frame andOffImg:(NSString *)offImg andOnImg:(NSString *)onImg withTitle:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setBackgroundImage:[UIImage imageNamed:offImg] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:onImg]  forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return button;
}

+ (UILabel *)BuildLableWithFrame:(CGRect )frame withFont:(UIFont *)font withText:(NSString *)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setText:text];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:font];
    [label setNumberOfLines:0];
    return label;
}

+ (UITextField *)BuildTextFieldWithFrame:(CGRect )frame andPlaceholder:(NSString *)placeholder
{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    [textField setPlaceholder:placeholder];
    return textField;
}


#pragma mark -ios6_7界面适配
+ (CGRect )AdapterIOS6_7ByIOS6Frame:(CGRect )frame;
{
    if([[UIDevice currentDevice] systemVersion].floatValue < 7.0)
    {
        return frame;
    }
    else
    {
        return CGRectMake(frame.origin.x, frame.origin.y + StatusBar_Height, frame.size.width, frame.size.height);
    }
}

+ (CGFloat )AdapterIOS6_7ByIOS6Float:(CGFloat )initial_y
{
    if([[UIDevice currentDevice] systemVersion].floatValue < 7.0)
    {
        return initial_y;
    }
    else
    {
        return initial_y + StatusBar_Height;
    }
}

#pragma mark -本地保存读取数据
+ (void)saveObject:(id)obj withKey:(NSString *)key
{
    NSUserDefaults *udf = [NSUserDefaults standardUserDefaults];
    
    //如果是自定义对象放在数组中，先要转成NSData再保存
    if([obj isKindOfClass:[NSArray class]]){
        //如果数组为空，return
        if([(NSArray *)obj count] <= 0){
            return ;
        }
        
        //如果数组装载 Model对象
        if ([[(NSArray *)obj objectAtIndex:0] isKindOfClass:[BaseModel class]]){
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:obj];
            [udf setObject:data forKey:key];
        }else{ //单纯的数组
            [udf setObject:obj forKey:key];
        }
        
        [udf synchronize];
        return ;
    }
    
    if([obj isKindOfClass:[BaseModel class]]){ //如果是自定义对象，先要转成NSData再保存
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:obj];
        [udf setObject:data forKey:key];
    }else{
        [udf setObject:obj forKey:key];
    }

    [udf synchronize];
}

+ (id)getObjectForKey:(NSString *)key
{
    id obj = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    if([obj isKindOfClass:[NSData class]]){  //如果保存的是对象，那么先取得NSData数据再转成对象，然后返回
        return [NSKeyedUnarchiver unarchiveObjectWithData:obj];
    }else{
        return obj;
    }
}


//用户数据解归档
+ (UserObj *)getUserObj;
{
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:USEROBJECT];
    UserObj *user = [[UserObj alloc] init];
    user = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return user;
}

//登录状态
+ (void)saveLoginInStatus:(BOOL)isSignIn
{
    [TSUserDefaults setBool:isSignIn forKey:@"signInStatus"];
}
+ (BOOL)loginInStatus
{
    return [TSUserDefaults boolForKey:@"signInStatus"];
}


+ (NSString *)getJsonDateString:(NSString *)JsonString
{
    NSArray *dateArr1 = [JsonString componentsSeparatedByString:@"("];
    if(dateArr1.count < 2){
        NSLog(@"不是标准的时间戳格式");
        return nil;
    }
    
    NSString *JsonString2 = dateArr1[1];
    NSArray *dateArr2 = [JsonString2 componentsSeparatedByString:@")"];
    if(dateArr2.count < 2){
        NSLog(@"不是标准的时间戳格式");
        return nil;
    }
    
    NSString *timeInterval = dateArr2[0];
    if(timeInterval.length > 10){
        int i = pow(10, timeInterval.length - 10);
        timeInterval = [NSString stringWithFormat:@"%lld",[timeInterval longLongValue]/i];
    }
    
    return timeInterval;
}

+ (NSArray *)getTimeArrByTimeInterval:(NSString *)timeInterval
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSDateFormatter *fm = [[NSDateFormatter alloc] init];
    [fm setDateFormat:@"hh:MM:ss"];
    NSString *dateString = [fm stringFromDate:date];
    NSArray *dateArr = [dateString componentsSeparatedByString:@":"];
    if(dateArr.count < 3){
        NSLog(@"时间戳解析有问题");
        return nil;
    }
    
    return dateArr;
}

+ (NSString *)getDateAndTimeArrByTimeInterval:(NSString *)timeInterval
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSDateFormatter *fm = [[NSDateFormatter alloc] init];
    [fm setDateFormat:@"yyyy/MM/dd hh:mm:ss"];
    return [fm stringFromDate:date];
}

+ (NSString *)getTimeByTimeInterval:(NSString *)timeInterval
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSDateFormatter *fm = [[NSDateFormatter alloc] init];
    [fm setDateFormat:@"yyyy-MM-dd"];
    return [fm stringFromDate:date];
}

+ (NSArray *)getTimeDifferenceByBeginTimeInterval:(NSString *)beginT
                              withEndTimeInterval:(NSString *)endT
{
    NSDate *beginDate   = [[NSDate alloc] initWithTimeIntervalSince1970:[beginT doubleValue]];
    NSDate *endDate     = [[NSDate alloc] initWithTimeIntervalSince1970:[endT doubleValue]];
    double  dateDiff    = [endDate timeIntervalSinceDate:beginDate];
    
    int  day            = dateDiff / 3600;
    int  minute         = (dateDiff - day * 3600) / 60;
    int  second         = dateDiff - day * 3600 - minute * 60;
    
    NSArray *diffTime = @[[NSString stringWithFormat:@"%d",day],[NSString stringWithFormat:@"%d",minute],[NSString stringWithFormat:@"%d",second]];
    
    return diffTime;
}




#pragma mark -数据转换
+(int) byteArrayToInt:(NSRange) range withData:(NSData *)data
{
    uint8_t buffer[4];
    [data getBytes:buffer range:range];
    int value=((buffer[0]<<24)&0xff000000)+((buffer[1]<<16)&0xff0000)+((buffer[2]<<8)&0xff00)+(buffer[3] & 0xff);  //数组信息转成整型
    return value;
}

//+(NSString *) byteArrayToString:(NSRange) range data:(NSData *)data
//{
//    unsigned char bufferLen[range.length];
//    [data getBytes:bufferLen range:range];
//    //const char *buf = (const char*)[data bytes];
//    NSString *value = [NSString stringWithCString:bufferLen encoding:NSUTF8StringEncoding];
//    return value;
//}

+(NSString *) byteArrayToString2:(NSRange) range data:(NSData *)data
{
    unsigned char bufferLen[range.length];
    [data getBytes:bufferLen range:range];
    
    NSString* value = [[NSString alloc] initWithBytes:bufferLen length:sizeof(bufferLen) encoding:NSUTF8StringEncoding];
    
    return value;
    
}

/**
 * @brief  将Json数据中的Date截取转换成yyyy-MM-dd HH:mm:ss格式的字符串
 * @param jsonDate json数据的Date
 * @return  返回yyyy-MM-dd HH:mm:ss格式的字符串
 */
+ (NSString *)convertJsonDateToIOSDate:(NSString *)jsonDate
{
    //返回的Json日期应该是这样的Date(xxxxxxxxx)
    NSString *tmpStr = [jsonDate substringWithRange:NSMakeRange(6, 13)];
    //将json日期转变为ios的系统时间
    NSTimeInterval userTime = [tmpStr doubleValue];
    
    //设定时间格式,这里可以设置成自己需要的格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    //这里比较关键,需要将NSTimeInterval除以1000
    NSString *iosDate = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:userTime/1000.0]];
    
    return iosDate;
}

#pragma mark - MD5

+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


@end




@implementation UIView (Extend)

- (float)top
{
    return self.frame.origin.y;
}

- (float)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (float)left
{
    return self.frame.origin.x;
}

- (float)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (float)width
{
    return self.frame.size.width;
}

- (float)height
{
    return self.frame.size.height;
}

- (void)setExclusiveTouchView:(UIView *)view
{
    [self setMultipleTouchEnabled:NO]; //多点触控禁用
    [view setExclusiveTouch:YES];   //单一点击
    
    if(view.subviews.count >= 1){
        for(UIView *v in view.subviews){
            [self setExclusiveTouchView:v];
        }
    }
}

@end
