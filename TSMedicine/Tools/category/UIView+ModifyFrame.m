//
//  UIView+ModifyFrame.m
//  babyshow_ios
//
//  Created by ludawei on 14-2-14.
//  Copyright (c) 2014年 platomix.dw. All rights reserved.
//

#import "UIView+ModifyFrame.h"

@implementation UIView (ModifyFrame)

- (float)maxX {
    return CGRectGetMaxX(self.frame);
}

- (float)maxY {
    return CGRectGetMaxY(self.frame);
}

- (float)minY {
    return CGRectGetMinY(self.frame);
}

- (float)minX {
    return CGRectGetMinX(self.frame);
}

- (float)midY {
    return CGRectGetMidY(self.frame);
}

- (float)midX {
    return CGRectGetMidX(self.frame);
}

- (void)setMidX:(float)midX {
    CGPoint center = self.center;
    center.x = midX;
    self.center = center;
}

- (void)setMidY:(float)midY {
    CGPoint center = self.center;
    center.y = midY;
    self.center = center;
}

- (void) makeCorner:(float)r {
    if (r < 0) r = 0;
    self.layer.cornerRadius = r;
    self.layer.masksToBounds = YES;
  
}

-(float) x {
    return self.frame.origin.x;
}

-(void) setX:(float) newX {
    CGRect frame = self.frame;
    frame.origin.x = newX;
    self.frame = frame;
}

-(float) y {
    return self.frame.origin.y;
}

-(void) setY:(float) newY {
    CGRect frame = self.frame;
    frame.origin.y = newY;
    self.frame = frame;
}

-(float) width {
    return self.frame.size.width;
}

-(void) setWidth:(float) newWidth {
    CGRect frame = self.frame;
    frame.size.width = newWidth;
    self.frame = frame;
}

-(float) height {
    return self.frame.size.height;
}

-(void) setHeight:(float) newHeight {
    CGRect frame = self.frame;
    frame.size.height = newHeight;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect rect = self.frame;
    rect.origin = CGPointMake(origin.x, origin.y);
    self.frame = rect;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect rect = self.frame;
    rect.size = CGSizeMake(size.width, size.height);
    self.frame = rect;
}




@end
