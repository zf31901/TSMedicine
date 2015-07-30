//
//  WITool.m
//  WITool
//

#import "WITool.h"

@implementation WITool

+ (UIWindow *)appWindow {
    return [UIApplication sharedApplication].keyWindow;
}

//剪切图片
+ (UIImage *)cutImage:(UIImage *)image withRect:(CGRect)rect {
    return [UIImage imageWithCGImage:CGImageCreateWithImageInRect([image CGImage], rect)];
}

+ (UIImage *)scaleImage:(UIImage *)image withSize:(CGSize)size {
    
    // 设置成为当前正在使用的context
    UIGraphicsBeginImageContext(image.size);
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

+ (void)hideAllKeyBoard {
    [[[UIApplication sharedApplication]keyWindow]endEditing:YES];
}

+ (UIView *)firstResponder {
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView   *firstResponder = [keyWindow performSelector:@selector(firstResponder)];
    return firstResponder;
}

+ (NSString *)durationStringWithSeconds:(int)seconds
{
    int degree, minute, second;
    second = (int)seconds % 60;
    minute = ((int)seconds / 60) % 60;
    degree = ((int)seconds / 60 / 60) % 60;
    if(degree > 0)
        return [NSString stringWithFormat:@"%02d:%02d:%02d", degree, minute, second];
    else
        return [NSString stringWithFormat:@"%02d:%02d", minute, second];
}

// 得到当前时间
+ (NSString *)getTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    NSString *time = [dateFormatter stringFromDate:[NSDate date]];
    return time;
}

+ (NSString *)dateformatter:(NSString *)str
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"MM月dd日";
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[str doubleValue]];
    NSString *date = [formatter stringFromDate:confromTimesp];
    return date;
}

+ (NSString *)dateformatterYear:(NSString *)str
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    formatter.dateFormat = @"yyyy.MM.dd";
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[str intValue]];
    NSString *date = [formatter stringFromDate:confromTimesp];
    return date;
}

// 得到状态栏
+ (UIView *)getStatusbarView;
{
    UIView *statusBar = nil;
    NSData *data = [NSData dataWithBytes:(unsigned char []){0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x42, 0x61, 0x72} length:9];
    NSString *key = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    id object = [UIApplication sharedApplication];
    if ([object respondsToSelector:NSSelectorFromString(key)]) statusBar = [object valueForKey:key];
    return statusBar;
}

+ (BOOL)isNull:(id)obj {
    if ([obj isKindOfClass:[NSNull class]] || !obj) {
        return YES;
    }
    
    if ([obj isKindOfClass:[NSString class]]) {
        if ([obj length] == 0) {
            return YES;
        }
    }
    return NO;
}

// 得到view所属viewController
+ (UIViewController *)findViewControllerWithView:(UIView *)view
{
    UIView *currentView = view.superview;
    while(currentView)
    {
        UIResponder *responder = [currentView nextResponder];
        if([responder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)responder;
        }
        currentView = currentView.superview;
    }
    return nil;
}

// 得到文字长和宽
+ (CGSize)getCGSzieWithText:(NSString *)text width:(float)maxwidth height:(float)maxheight font:(float)font
{
    CGRect textRect = [text boundingRectWithSize:CGSizeMake(maxwidth,maxheight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    return textRect.size;
}

// UIColor转UIImage
+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

// 截屏
+ (UIImage *)getScreenImage:(UIView *)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}

// 下载单张图片
+ (void)downloadImageWithUrl:(NSString *)url complete:(SSDownloadImageFinishBlock)finish
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *dataImage = [UIImage imageWithData:data];
            finish(dataImage);
        });
    });
}

// 去除文本中html标签
+ (NSString *)deleteHTML:(NSString *)html
{
    NSRange range;
    while ((range = [html rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound){
        html = [html stringByReplacingCharactersInRange:range withString:@""];
    }
    // 去掉空格
    NSString *tempHtml = [html stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    return tempHtml;
}

// 判断是否为浮点
+ (BOOL)isPureFloat:(NSString *)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

// 邮箱验证
+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

// 手机号码验证
+ (BOOL)isValidateMobile:(NSString *)mobile
{
    //手机号以13，15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}


@end
