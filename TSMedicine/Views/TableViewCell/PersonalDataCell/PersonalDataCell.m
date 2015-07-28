//
//  PersonalDataCell.m
//  TSMedicine
//
//  Created by lyy on 15-6-12.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "PersonalDataCell.h"

@implementation PersonalDataCell


-(void)update
{
      self.backgroundColor = self.cellData[@"color"];
    self.personalDaga_textLab.text = self.cellData[@"textlab"];
    self.personalData_imgView.layer.cornerRadius = self.personalData_imgView.width/2;
    self.personalData_imgView.layer.masksToBounds = YES;

}
-(CGFloat)getCellHeight
{
    return 56;
}
@end
