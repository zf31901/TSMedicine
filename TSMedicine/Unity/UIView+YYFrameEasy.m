//
//  UIView+YYFrameEasy.m
//  TSMedicine
//
//  Created by lyy on 15-6-10.
//  Copyright (c) 2015年 LYY. All rights reserved.
//

#import "UIView+YYFrameEasy.h"

@implementation UIView (YYFrameEasy)
-(CGFloat)x
{
    return self.frame.origin.x;
}
-(CGFloat)y
{
    return self.frame.origin.y;
}
-(CGFloat)width
{
    return self.frame.size.width;
}
-(CGFloat)height
{
    return self.frame.size.height;
}
-(CGFloat)distance
{
    return self.frame.origin.y+self.frame.size.height;
}
-(void)setY:(CGFloat)y
{
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}
-(void)setX:(CGFloat)x
{
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}
-(void)setHeight:(CGFloat)height
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}
-(void)setWidth:(CGFloat)width
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}
+(CGFloat)getScreenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}
+(CGFloat)getScreenHeight
{
    return [UIScreen mainScreen].bounds.size.height;
}
@end
