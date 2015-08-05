//
//  ShopCell.m
//  customCellByCode
//
//  Created by Imanol on 11/10/14.
//  Copyright (c) 2014 ImanolZhang. All rights reserved.
//
#import "UIImageView+AFNetworking.h"

#define kCellBorder 20
#define kCellCenterX self.frame.size.width/2
#define kNameFont [UIFont systemFontOfSize:16]
#define kDescriptionFont [UIFont systemFontOfSize:14]
#define kImageWH 70
    
#import "NewsTableViewCell.h"
#import "ShopFrame.h"



@interface NewsTableViewCell ()
    
    
@end
    
@implementation NewsTableViewCell
    
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self) {
        UILabel *fromlable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
        fromlable.numberOfLines=0;
        
        CGRect rect = [fromlable.text boundingRectWithSize:CGSizeMake(200, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:fromlable.font} context:nil];
        
        //设置label的高度
        fromlable.frame = CGRectMake(0, 20, 200, rect.size.height);
        
        [self.contentView addSubview:fromlable];
        
    }
    return self;
    
}
    


    
    @end





