//
//  RegisterViewController.h
//  TSMedicine
//
//  Created by lyy on 15-7-30.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "BaseViewController.h"

@interface RegisterViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneNumbTF;
@property (weak, nonatomic) IBOutlet UITextField *verifyTF;
@property (weak, nonatomic) IBOutlet UIButton *verifyBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end
