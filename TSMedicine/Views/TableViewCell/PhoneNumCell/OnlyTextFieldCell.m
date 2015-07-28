//
//  OnlyTextFieldCell.m
//  EwtBuyer
//
//  Created by lyy on 15-5-22.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "OnlyTextFieldCell.h"

@implementation OnlyTextFieldCell

- (void)update
{
    self.backgroundColor = self.cellData[@"color"];
    self.onlyTextField.placeholder = self.cellData[@"onlyTextField"];    
}
-(CGFloat)getCellHeight
{
    return [self.cellData[@"h"] floatValue];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
