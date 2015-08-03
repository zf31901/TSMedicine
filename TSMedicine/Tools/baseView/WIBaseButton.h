//
//  WIBaseButton.h
//  nRF_Proximity
//
//  Created by licy on 14-7-11.
//  Copyright (c) 2014年 licy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WIBaseButton : UIButton

//带背景图片
+ (WIBaseButton *)createClassWithBgNormal:(NSString *)
bgNormal andWithBgHight:(NSString *)bgHight andWithTarget:(id)target andWithAction:(SEL)sel;

//带图片
+ (WIBaseButton *)createClassWithImgNormal:(NSString *)
imgNormal andWithImgHight:(NSString *)imgHight andWithTarget:(id)target andWithAction:(SEL)sel;

//带颜色
+ (WIBaseButton *)createClassWithBgColor:(UIColor *)
color andWithTarget:(id)target andWithAction:(SEL)sel;

//title赋值
+ (WIBaseButton *)createClassWithTitle:(NSString *)title withTarget:(id)target withAction:(SEL)sel withFontSize:(CGFloat)fontSize withFrame:(CGRect)rect;

//带select图片
+ (WIBaseButton *)createClassWithImgNormal:(NSString *)
imgNormal andWithImgSelect:(NSString *)imgSelect andWithTarget:(id)target andWithAction:(SEL)sel;

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event;

@end
