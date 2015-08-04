//
//  TSUtilsDefine.h
//  TSMedicine
//
//  Created by lyy on 15-7-30.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSUtilsDefine : NSObject

#define Main_Size                   [UIScreen mainScreen].bounds.size
#define TabBar_Height               49
#define WEAKSELF __weak typeof(self) weakSelf = self;

//颜色快速生成
#define RGB(r,g,b)                  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r,g,b,a)               [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGBS(s)                     [UIColor colorWithRed:s/255.0 green:s/255.0 blue:s/255.0 alpha:1.0]
#define VioletColor                 [UIColor colorWithRed:145.0/255.0 green:92.0/255.0 blue:230.0/255.0 alpha:1.0]
#define VioletSubColor              [UIColor colorWithRed:160.0/255.0 green:117.0/255.0 blue:230.0/255.0 alpha:1.0]
#define NavBarColor                 [UIColor colorWithRed:204/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]


//版本号
#define current_version [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define SysFont(f)  [UIFont systemFontOfSize:f]
#define BoldFont(f) [UIFont boldSystemFontOfSize:f]
#define FontWithName(fontName,f) [UIFont fontWithName:fontName size:f];


//获取十六进制颜色值
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//关闭打印 置0 开启置1
#define SADEBUG 1
#if SADEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif



@end