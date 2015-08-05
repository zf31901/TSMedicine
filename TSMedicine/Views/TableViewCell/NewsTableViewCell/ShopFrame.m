//
//  ShopFrame.m
//  customCellByCode
//
//  Created by Imanol on 11/10/14.
//  Copyright (c) 2014 ImanolZhang. All rights reserved.
//

#define kCellBorder 10
#define kCellCenterX self.frame.size.width/2
#define kNameFont [UIFont systemFontOfSize:16]
#define kDescriptionFont [UIFont systemFontOfSize:14]
#define kImageWH 70

#import "ShopFrame.h"


@implementation ShopFrame




-(void)settingFrame{
    
    CGFloat nameX = kCellBorder;
    CGFloat nameY = kCellBorder;
    UILabel*lab=[[UILabel alloc]init];
    
    
    
//   CGSize nameSize = [ sizeWithFont:kNameFont];
//    _nameF = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
//
//    
//    CGFloat descriptionX = kCellBorder;
//    CGFloat descriptionY = CGRectGetMaxY(_nameF) + kCellBorder;
//   CGSize descriptionSize = [_shop.dcription sizeWithFont:kDescriptionFont constrainedToSize:CGSizeMake(320, MAXFLOAT)];
//    _descriptionF = CGRectMake(descriptionX, descriptionY, descriptionSize.width, descriptionSize.height);
//    
//    CGFloat imageX = kCellBorder;
//    CGFloat imageY = CGRectGetMaxY(_descriptionF)+kCellBorder;
//    _imageViewF = CGRectMake(imageX, imageY, kImageWH, kImageWH);
//    
//    _cellHeight = CGRectGetMaxY(_imageViewF);
    
}
@end
