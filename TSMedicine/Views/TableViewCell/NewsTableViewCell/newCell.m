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

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        _iamge = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
//        [self.contentView addSubview:_iamge];
//        
//        _fromeLable = [[UILabel alloc]initWithFrame:CGRectMake(100, 320, 100, 30)];
//        _fromeLable.textColor = [UIColor redColor];
//        [self.contentView addSubview:_fromeLable];
//        
//        _dataTimew = [[UILabel alloc]initWithFrame:CGRectMake(200, 320, 100, 30)];
//        [self.contentView addSubview:_dataTimew];
       
        UILabel *fromlable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 1500, 40)];
        fromlable.numberOfLines=0;
       
        CGRect rect = [fromlable.text boundingRectWithSize:CGSizeMake(200, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:fromlable.font} context:nil];
        
        //设置label的高度
        fromlable.frame = CGRectMake(0, 20, 200, rect.size.height);
        
        [self.contentView addSubview:fromlable];
        
        
        
    }
    return self;
}



@end
