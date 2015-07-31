//
//  RegisterNextViewController.m
//  TSMedicine
//
//  Created by lyy on 15-7-31.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "RegisterNextViewController.h"

@interface RegisterNextViewController ()

@end

@implementation RegisterNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavView];
    [self drawUI];
    
}

-(void)setNavView
{
    self.navigationController.navigationBarHidden  = NO;
    self.title = @"确认密码";
    
}

-(void)drawUI
{
    _finishBtn.layer.cornerRadius = 4.0;
    [_finishBtn setBackgroundColor:CommonBgColor];
    
}

- (IBAction)finishBtnClick:(id)sender {
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hidKeyBoard];
}
-(void)hidKeyBoard
{
    [WITool hideAllKeyBoard];
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
