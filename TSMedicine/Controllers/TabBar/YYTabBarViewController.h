//
//  YYTabBarViewController.h
//  TSMedicine
//
//  Created by lyy on 15-6-10.
//  Copyright (c) 2015年 LYY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, YYTabBarAnimationDirection) {
    YYTabBarAnimationDirectionLeft,
    YYTabBarAnimationDirectionRight,
    YYTabBarAnimationDirectionDown,
};

@interface YYTabBarViewController : UITabBarController

+ (YYTabBarViewController *)initIalizeTab;
//ios 6.0 使用的方法, 适配之前需要重构函数实现
+ (void)setTabBarHiddenOrShow:(BOOL)isHiddenAndShow isAnimation:(BOOL)isAnimation
                 andDirection:(YYTabBarAnimationDirection)direction;

@end