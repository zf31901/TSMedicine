//
//  UIView+YYFrameEasy.h
//  TSMedicine
//
//  Created by lyy on 15-6-10.
//  Copyright (c) 2015年 LYY. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TOPBAR (44+20)
#define BOTTOMBAR 49
#define SCREEN_H [UIView getScreenHeight]
#define SCREEN_W [UIView getScreenWidth]

@interface UIView (YYFrameEasy)
-(CGFloat)x;
-(CGFloat)y;
-(CGFloat)width;
-(CGFloat)height;
-(CGFloat)distance;
-(void)setY:(CGFloat)y;
-(void)setHeight:(CGFloat)height;
-(void)setX:(CGFloat)x;
-(void)setWidth:(CGFloat)width;
+(CGFloat)getScreenWidth;
+(CGFloat)getScreenHeight;
@end
