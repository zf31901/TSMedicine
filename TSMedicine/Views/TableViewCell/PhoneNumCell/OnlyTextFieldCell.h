//
//  OnlyTextFieldCell.h
//  EwtBuyer
//
//  Created by lyy on 15-5-22.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OnlyTextFieldCell : X_TableViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *onlyTextField;


@end
