//
//  UIView+ModifyFrame.h
//  babyshow_ios
//
//  Created by ludawei on 14-2-14.
//  Copyright (c) 2014年 platomix.dw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ModifyFrame)

- (void) makeCorner:(float)r;
@property float x;
@property float y;
@property float width;
@property float height;
@property (readonly) float maxX;
@property (readonly) float maxY;
@property (readonly) float minY;
@property (readonly) float minX;
@property float midY;
@property float midX;
@property CGPoint origin;
@property CGSize size;



@end
