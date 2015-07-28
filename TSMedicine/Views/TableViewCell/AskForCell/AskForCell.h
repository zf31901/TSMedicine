//
//  AskForCell.h
//  TSMedicine
//
//  Created by lyy on 15-6-19.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AskForCell : X_TableViewCell
@property (weak, nonatomic) IBOutlet UILabel *askFor_nameLab;
@property (weak, nonatomic) IBOutlet UITextField *askfor_textField;



@property (weak, nonatomic) IBOutlet UIImageView *askFor_rightImg;

@end
