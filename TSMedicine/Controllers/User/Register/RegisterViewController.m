//
//  RegisterViewController.m
//  TSMedicine
//
//  Created by lyy on 15-7-30.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterNextViewController.h"

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
    [_nextBtn setBackgroundColor:CommonBgColor];
    
}

//获取验证码
- (IBAction)getVerifyCodeBtnClick:(id)sender {
    

    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:_phoneNumbTF.text forKey:@"phone"];
    
    [HttpRequest GETURLString:@"/User/register/sendverifycode/" userCache:NO parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObj) {
        
        NSLog(@"responseObj === %@",responseObj);
        
         NSDictionary *rqDic = (NSDictionary *)responseObj;
        
//        NSLog(@"%d",[rqDic[@"state"] boolValue]);
        
        if ([rqDic[@"state"] boolValue]) {
            
            NSArray *dataArr = (NSArray *)[rqDic[@"data"] objectFromJSONString];
            NSDictionary *dic = (NSDictionary *)dataArr;
            
            NSLog(@"dic ==== %@",dic);
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
    
}

//下一步
- (IBAction)nextBtnClick:(id)sender {
    
    
    if (_phoneNumbTF.text.length > 0 && _verifyTF.text.length == 4) {
        
        RegisterNextViewController *nextRgster = [[RegisterNextViewController alloc] init];
        [self.navigationController pushViewController:nextRgster animated:YES];
    }
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
