//
//  NSString+autoResize.m
//  宝宝秀
//
//  Created by licy on 14-5-19.
//  Copyright (c) 2014年 platomix.dw. All rights reserved.
//

#import "NSString+autoResize.h"

@implementation NSString (autoResize)

-(CGSize)sizeWithWidth:(CGFloat)width withFont:(CGFloat)font
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}  context:nil];
    
    return rect.size;
}

-(CGSize)sizeWithWidth:(CGFloat)width height:(CGFloat)height font:(CGFloat)font {
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}  context:nil];
    
    return rect.size;
}

-(CGSize)heightWithWidth:(CGFloat)width withFont:(CGFloat)font
{
    
    CGSize maximumLabelSize = CGSizeMake(width,9999);
    CGSize expectedLabelSize = [self sizeWithFont:SysFont(font)
                                constrainedToSize:maximumLabelSize
                                    lineBreakMode:NSLineBreakByCharWrapping];
    return expectedLabelSize;
}

@end
