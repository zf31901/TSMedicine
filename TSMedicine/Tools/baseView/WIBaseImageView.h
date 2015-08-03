//
//  WIBaseImageView.h
//  nRF_Proximity
//
//  Created by licy on 14-7-11.
//  Copyright (c) 2014年 licy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WIBaseImageView : UIImageView

//创建uiimageview
+ (WIBaseImageView *)createClassWithFrame:(CGRect)frame andWithImg:(NSString *)img andWithTag:(NSInteger)tag andWithEnable:(BOOL)enable;

//创建从网络下载图片的uiimageview
+ (WIBaseImageView *)createClassNetWorkWithFrame:(CGRect)frame andWithUrlImg:(NSString *)img andPlaceholderImage:(NSString *)placeholderImage andWithTag:(NSInteger)tag andWithEnable:(BOOL)enable;

+ (WIBaseImageView *)createWithFrame:(CGRect)frame img:(NSString *)img tag:(NSInteger)tag enable:(BOOL)enable;

@end
