//
//  PersonalCell.m
//  TSMedicine
//
//  Created by lyy on 15-6-12.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "PersonalCell.h"

@implementation PersonalCell

-(void)update
{
    self.backgroundColor = self.cellData[@"color"];
    self.persional_textLab.text  = self.cellData[@"textlab"];
    self.persional_detailLab.text = self.cellData[@"detailLab"];
    
}
-(CGFloat)getCellHeight
{
    return 44;
}
@end
