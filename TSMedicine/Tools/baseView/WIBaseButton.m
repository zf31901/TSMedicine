//
//  WIBaseButton.m
//  nRF_Proximity
//
//  Created by licy on 14-7-11.
//  Copyright (c) 2014年 licy. All rights reserved.
//

#import "WIBaseButton.h"

@implementation WIBaseButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//带背景图片
+ (WIBaseButton *)createClassWithBgNormal:(NSString *)
bgNormal andWithBgHight:(NSString *)bgHight andWithTarget:(id)target andWithAction:(SEL)sel {
    
    WIBaseButton *mBtn = [WIBaseButton buttonWithType:UIButtonTypeCustom];
    [mBtn setBackgroundImage:[UIImage imageNamed:bgNormal] forState:UIControlStateNormal];
    [mBtn setBackgroundImage:[UIImage imageNamed:bgHight] forState:UIControlStateHighlighted];
    [mBtn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return mBtn;
}

//带图片
+ (WIBaseButton *)createClassWithImgNormal:(NSString *)
imgNormal andWithImgHight:(NSString *)imgHight andWithTarget:(id)target andWithAction:(SEL)sel {
    WIBaseButton *mBtn = [WIBaseButton buttonWithType:UIButtonTypeCustom];
    [mBtn setImage:[UIImage imageNamed:imgNormal] forState:UIControlStateNormal];
    [mBtn setImage:[UIImage imageNamed:imgHight] forState:UIControlStateHighlighted];
    if (sel) {
        [mBtn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    }
    
    return mBtn;
}

//带select图片
+ (WIBaseButton *)createClassWithImgNormal:(NSString *)
imgNormal andWithImgSelect:(NSString *)imgSelect andWithTarget:(id)target andWithAction:(SEL)sel {
    WIBaseButton *mBtn = [WIBaseButton buttonWithType:UIButtonTypeCustom];
    [mBtn setImage:[UIImage imageNamed:imgNormal] forState:UIControlStateNormal];
    [mBtn setImage:[UIImage imageNamed:imgSelect] forState:UIControlStateSelected];
    [mBtn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return mBtn;
}

//title赋值
+ (WIBaseButton *)createClassWithTitle:(NSString *)title withTarget:(id)target withAction:(SEL)sel withFontSize:(CGFloat)fontSize withFrame:(CGRect)rect {
    WIBaseButton *mBtn = [WIBaseButton buttonWithType:UIButtonTypeCustom];
    mBtn.frame = rect;
    [mBtn setTitle:title forState:UIControlStateNormal];
    [mBtn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    [mBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    mBtn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    return mBtn;
}

//带颜色
+ (WIBaseButton *)createClassWithBgColor:(UIColor *)
color andWithTarget:(id)target andWithAction:(SEL)sel {
    
    WIBaseButton *mBtn = [WIBaseButton buttonWithType:UIButtonTypeCustom];
    [mBtn setBackgroundColor:color];
    [mBtn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return mBtn;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    CGRect bounds = self.bounds;
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
