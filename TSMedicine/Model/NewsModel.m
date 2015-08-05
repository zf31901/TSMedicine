//
//  NewsModel.m
//  TSMedicine
//
//  Created by lyy on 15-7-7.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel
+ (CGFloat)heightWithString:(NSString *)string font:(UIFont *)font constrainedToWidth:(CGFloat)width{
    CGSize rtSize;
    rtSize=[string sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    return rtSize.height;
}



@end
