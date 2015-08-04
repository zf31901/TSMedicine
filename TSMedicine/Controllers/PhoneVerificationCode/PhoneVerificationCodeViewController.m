//
//  PhoneVerificationCodeViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-30.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "PhoneVerificationCodeViewController.h"

@interface PhoneVerificationCodeViewController ()
@property (weak, nonatomic) IBOutlet X_TableView *tableView;

@end

@implementation PhoneVerificationCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden  = NO;
    self.title = @"手机验证";
    NSMutableArray *arr=[[NSMutableArray alloc]init];
  
    
    
    
    
    
    
    [arr addObject:[@{
                      kCellTag:@"PhoneNumCell",
                      kCellDidSelect:@"phoneNumCode",
                      @"color":[UIColor whiteColor],
                      @"phoneNum_textField":@"请输入手机号码",
                      @"CodeBtnTitle":@"获取验证码",
                      @"phoneIsEnabled":@NO,
                      @"h":@"44",
                      } mutableCopy]];
    [arr addObject:[@{
                      kCellTag:@"ThinLine",
                      kCellDidSelect:@"f1",
                      @"l":@"12",
                      } mutableCopy]];
    [arr addObject:[@{
                      kCellTag:@"OnlyTextFieldCell",
                      kCellDidSelect:@"VerificationCode",
                      @"color":[UIColor whiteColor],
                      @"onlyTextField":@"请输入验证码",
                      @"h":@"44",
                      } mutableCopy]];


    [arr addObject:[@{
                      kCellTag:@"line",
                      kCellDidSelect:@"f1",
                      @"color":RGB(242, 242, 242),
                      @"h":@"10",
                      } mutableCopy]];
    [arr addObject:[@{
                      kCellTag:@"ExitLoginCell",
                      kCellDidSelect:@"exitLogin",
                      @"color":[UIColor clearColor],
                      @"exitLogin_btn":@"下一步",
                      @"loginBtnColor":VioletSubColor,
                      @"h":@"45",
                      } mutableCopy]];
    
    self.tableView.xDataSource = arr;
    

    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
