//
//  NSString+autoResize.h
//  宝宝秀
//
//  Created by licy on 14-5-19.
//  Copyright (c) 2014年 platomix.dw. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "WIDevice.h"

@interface NSString (autoResize)

-(CGSize)sizeWithWidth:(CGFloat)width withFont:(CGFloat)font;

-(CGSize)sizeWithWidth:(CGFloat)width height:(CGFloat)height font:(CGFloat)font;

-(CGSize)heightWithWidth:(CGFloat)width withFont:(CGFloat)font;

@end
