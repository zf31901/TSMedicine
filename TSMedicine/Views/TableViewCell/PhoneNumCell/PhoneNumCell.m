//
//  PhoneNumCell.m
//  EwtBuyer
//
//  Created by lyy on 15-5-26.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "PhoneNumCell.h"

@implementation PhoneNumCell

- (void)update
{
    self.phoneNum_textField.keyboardType = UIKeyboardTypePhonePad;
    self.phoneNum_textField.placeholder = self.cellData[@"phoneNum_textField"];
    self.phoneNum_textField.delegate = self;
    self.phoneCode_button.layer.cornerRadius = 2.0;
    self.phoneCode_button.layer.masksToBounds = YES;
    [self.phoneCode_button setTitle:self.cellData[@"CodeBtnTitle"] forState:UIControlStateNormal];
    self.phoneCode_button.layer.borderWidth = 1;
    self.phoneCode_button.layer.borderColor = RGBS(199).CGColor;
    [self.phoneCode_button setEnabled:[self.cellData[@"phoneIsEnabled"] boolValue]];
    [self.phoneCode_button  addTarget:self action:@selector(phoneBtnClick) forControlEvents:UIControlEventTouchUpInside];
    if ([self.cellData[@"phoneNum_textField"] isEqualToString:@"请输入验证码"])
    {
        [self  timeout];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([self.cellData[@"phoneNum_textField"] isEqualToString:@"请输入验证码"])
    {
        if (textField.text.length > 6)
        {
             [self dispatchCellEventWithName:@"nextPhoneCode"];
        }
        
    }else
    {
        if (textField.text.length >6 && textField.text.length <12)
        {
            [self  greenPhoneBtn];
        }else if (textField.text.length < 6)
        {
            [self grayPhoneBtn];
        }else if (textField.text.length > 13)
        {
            NSMutableString *newString = [NSMutableString stringWithString:self.phoneNum_textField.text];
            [newString replaceCharactersInRange:NSMakeRange(newString.length - 1, 1) withString:@""];
            self.phoneNum_textField.text = newString;
            [self dispatchCellEventWithName:@"alertView"];
        }

    }
      return YES;
}

- (void)phoneBtnClick
{
    self.phoneNum_textField.userInteractionEnabled = NO;
    [self  timeout];
    [self grayPhoneBtn];
}

- (void)greenPhoneBtn
{
    [self.phoneCode_button setTitleColor:RGBS(199) forState:UIControlStateNormal];
    self.phoneCode_button.layer.borderColor = RGBS(199).CGColor;
    [self.phoneCode_button setEnabled:YES];
}
- (void)grayPhoneBtn
{
    [self.phoneCode_button setEnabled:NO];
    [self.phoneCode_button setTitleColor:RGBS(199) forState:UIControlStateNormal];
    self.phoneCode_button.layer.borderColor = RGBS(199).CGColor;
}
- (void)timeout
{
    __block  int timeout = 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(nil, 0), 1.0 * NSEC_PER_SEC, 0 );
    dispatch_source_set_event_handler(timer, ^{
        if (timeout <= 0)
        {
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"设置按扭显示 ");
                [self.phoneCode_button setTitle:@"点击重新获取" forState:UIControlStateNormal];
                [self greenPhoneBtn];
            });
            
        }else
        {
            int  minutes  = timeout%61;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.phoneCode_button setTitle:[NSString stringWithFormat:@"%d秒后可重发",minutes] forState:UIControlStateNormal];
            });
            timeout --;
            
        }
    });
    dispatch_resume(timer);
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
