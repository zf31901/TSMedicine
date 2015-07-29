//
//  SetTSMCell.m
//  TSMedicine
//
//  Created by lyy on 15-6-11.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "SetTSMCell.h"

@implementation SetTSMCell

-(void)update{
    self.backgroundColor = self.cellData[@"color"];
    self.setTSM_textLab.text = self.cellData[@"setTSM_textLab"];
}
-(CGFloat)getCellHeight
{
    return [self.cellData[@"h"] floatValue];
}
@end
