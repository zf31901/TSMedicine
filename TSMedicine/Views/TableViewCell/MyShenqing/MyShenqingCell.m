//
//  MyShenqingCell.m
//  TSMedicine
//
//  Created by lyy on 15-6-26.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "MyShenqingCell.h"

@implementation MyShenqingCell

- (void)update
{
    self.backgroundColor = self.cellData[@"color"];
    [self.waitBtn setTitle:self.cellData[@"waitBtnTitle"] forState:UIControlStateNormal];
    if ([self.cellData[@"waitBtnTitle"] isEqualToString:@"申请通过"] ||[self.cellData[@"waitBtnTitle"] isEqualToString:@"考核通过"])
    {
        [self.waitBtn setTitleColor:RGB(32, 164, 86) forState:UIControlStateNormal];
    }else
    {
        [self.waitBtn setTitleColor:RGB(255, 102, 0) forState:UIControlStateNormal];
    }
    
}
-(CGFloat)getCellHeight
{
    return [self.cellData[@"h"] floatValue];
}

@end
