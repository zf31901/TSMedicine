//
//  LoginViewController.m
//  TSMedicine
//
//  Created by lyy on 15-7-6.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavView];
    
}

-(void)setNavView
{
    self.navigationController.navigationBarHidden  = NO;
    self.title = @"登录";
}

#pragma mark -------登录-------------
- (IBAction)loginBtn:(id)sender {
    
    if (![self cheakText]) {
        return;
    }
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:_nikeName.text forKey:@"u"];
    [parameters setObject:_pawssWorld.text forKey:@"pwd"];
    
    [HttpRequest POSTURLString:@"/User/login/" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rqDic = (NSDictionary *)responseObject;
        
        if ([rqDic[@"state"] boolValue]) {
//            NSLog(@"rqdic------>>%@",rqDic);
            NSArray *dataArr_login = (NSArray *)[rqDic[@"data"] objectFromJSONString];
            NSDictionary *dic_login = (NSDictionary *)dataArr_login;
            NSLog(@"dic_login = %@",dic_login);
            
            NSDictionary *param = @{@"u": _nikeName.text, @"clientkey": dic_login[@"clientkey"]};
            [self loadUserInfoDataWith:param];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
    [self hidKeyBoard];
}

// 获取用户信息
-(void)loadUserInfoDataWith:(NSDictionary *)dic
{
    
    [HttpRequest GETURLString:@"/User/info/" parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObj) {
        
        NSLog(@"responseObj == %@",responseObj);
        NSLog(@"msg == %@",responseObj[@"msg"]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"error = %@",error);
    }];
    
}

#pragma mark --------------注册---------------
- (IBAction)regainBtn:(id)sender {
    
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

-(BOOL)cheakText
{
    if (_nikeName.text.length == 0) {
        [self showAlertViewWithTitle:@"用户名不能为空" andDelay:1.5];
        return NO;
    }
    if (_pawssWorld.text.length == 0) {
        [self showAlertViewWithTitle:@"密码不能为空" andDelay:1.5];
        return NO;
    }
    return YES;
}

-(void)showAlertViewWithTitle:(NSString *)title andDelay:(CGFloat)time
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:title delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alert show];
    [self performSelector:@selector(removeAlert:) withObject:alert afterDelay:time];
    
}
-(void)removeAlert:(UIAlertView *)alertView
{
    [alertView removeFromSuperview];
    alertView = nil;
}

-(void)hidKeyBoard
{
    [WITool hideAllKeyBoard];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hidKeyBoard];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden  = YES;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
