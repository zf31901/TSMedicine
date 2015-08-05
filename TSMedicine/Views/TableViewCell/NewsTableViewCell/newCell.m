//
//  newCell.m
//  TSMedicine
//
//  Created by 123 on 15/8/3.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "newCell.h"
#import "UIImageView+AFNetworking.h"

@implementation newCell
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
