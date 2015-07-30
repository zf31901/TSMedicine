//
//  RegisterViewController.m
//  TSMedicine
//
//  Created by lyy on 15-7-30.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setNavView];
    [self drawUI];
    
}

-(void)setNavView
{
    self.navigationController.navigationBarHidden  = NO;
    self.title = @"手机验证";
}

-(void)drawUI
{
    _verifyBtn.layer.borderWidth = 1.0;
    _verifyBtn.layer.cornerRadius = 4.0;
    _verifyBtn.layer.borderColor = RGBA(0, 0, 0, 0.2).CGColor;
    
    _nextBtn.layer.cornerRadius = 4.0;
    
}

//获取验证码
- (IBAction)getVerifyCodeBtnClick:(id)sender {
    
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:_phoneNumbTF.text forKey:@"phone"];
    [parameters setObject:@1 forKey:@"appid"];
    [HttpRequest POSTURLString:@"User/register/sendverifycode" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"responseObject = %@",responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    
}

//下一步
- (IBAction)nextBtnClick:(id)sender {
    
    
}


- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
