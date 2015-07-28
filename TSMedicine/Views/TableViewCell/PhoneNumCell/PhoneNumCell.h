//
//  PhoneNumCell.h
//  EwtBuyer
//
//  Created by lyy on 15-5-26.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneNumCell : X_TableViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneNum_textField;
@property (weak, nonatomic) IBOutlet UIButton *phoneCode_button;
@end
