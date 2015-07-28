//
//  ExitLoginCell.m
//  TSMedicine
//
//  Created by lyy on 15-6-12.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "ExitLoginCell.h"

@implementation ExitLoginCell

-(void)update{
    self.backgroundColor = self.cellData[@"color"];
    [self.exitLogin_btn setTitle:self.cellData[@"exitLogin_btn"] forState:UIControlStateNormal];
    self.exitLogin_btn.backgroundColor = self.cellData[@"loginBtnColor"];
    self.exitLogin_btn.layer.cornerRadius = 4;
    self.exitLogin_btn.layer.masksToBounds = YES;
}
-(CGFloat)getCellHeight
{
    return [self.cellData[@"h"] floatValue];
}
@end
