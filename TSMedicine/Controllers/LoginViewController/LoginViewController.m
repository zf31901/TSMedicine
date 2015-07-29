//
//  LoginViewController.m
//  TSMedicine
//
//  Created by lyy on 15-7-6.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "LoginViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBarHidden  = NO;
    self.title = @"登录";
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden  = YES;
}

- (IBAction)loginBtn:(id)sender {
    

    
    if (self.nikeName.text != nil && self.pawssWorld.text !=nil)
    {
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters setObject:_nikeName.text forKey:@"u"];
        [parameters setObject:_pawssWorld.text forKey:@"pwd"];
        
        [HttpRequest POSTURLString:@"user/login" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSDictionary *rqDic = (NSDictionary *)responseObject;
            
//            if ([rqDic[@"state"] boolValue]) {
//                 NSLog(@"rqdic------>>%@",rqDic);
//                NSArray *dataArr_login = (NSArray *)[rqDic[@"data"] objectFromJSONString];
//                NSLog(@"dataArr_login = %@",dataArr_login);
//                
//            }
            
//            NSLog(@"responseObject == %@",responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
//            NSLog(@"error = %@",error);
            
        }];
        
    }else
    {
        
        
    }
}



#pragma mark --------------注册---------------
- (IBAction)regainBtn:(id)sender {
    
    YYHttpRequest *hq = [YYHttpRequest shareInstance];
    [hq GETURLString:@"http://app.aixinland.cn/api/news/List?pageid=1&pagesize=2" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObj) {
        NSDictionary *rqDic = (NSDictionary *)responseObj;
        
//        NSLog(@"rqdic=======%@",responseObj);
//        NSLog(@"message == %@",responseObj[@"message"]);

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@ , %@",operation,error);
    }];


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
