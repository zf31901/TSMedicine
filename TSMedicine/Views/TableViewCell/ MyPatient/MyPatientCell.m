//
//  MyPatientCell.m
//  TSMedicine
//
//  Created by lyy on 15-6-16.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "MyPatientCell.h"

@implementation MyPatientCell
-(void)update
{
    self.backgroundColor = self.cellData[@"color"];
    self.patient_nameLab.text = self.cellData[@"nameLab"];
    self.patient_phoneNumLab.text = self.cellData[@"phoneNumLab"];
    self.patient_reportLab.text = self.cellData[@"reportLab"];
    self.patient_reportLab.textColor = self.cellData[@"reportLabColor"];
}
-(CGFloat)getCellHeight
{
    return 60;
}

@end
