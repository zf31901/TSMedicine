//
//  MyPatientCell.h
//  TSMedicine
//
//  Created by lyy on 15-6-16.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPatientCell : X_TableViewCell
@property (weak, nonatomic) IBOutlet UILabel *patient_nameLab;
@property (weak, nonatomic) IBOutlet UILabel *patient_phoneNumLab;
@property (weak, nonatomic) IBOutlet UILabel *patient_reportLab;

@end
