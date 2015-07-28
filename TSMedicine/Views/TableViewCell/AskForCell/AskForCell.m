//
//  AskForCell.m
//  TSMedicine
//
//  Created by lyy on 15-6-19.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "AskForCell.h"

@implementation AskForCell

- (void)update
{
    self.askFor_nameLab.text = self.cellData[@"nameLab"];
    self.askfor_textField.text = self.cellData[@"detaillab"];
    self.askFor_rightImg.hidden = [self.cellData[@"rightImgHidden"] boolValue];
}
- (CGFloat)getCellHeight
{
    return 44;
}

@end
