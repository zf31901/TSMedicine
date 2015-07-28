//
//  SetMyTSMViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-12.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "SetMyTSMViewController.h"
#import "AboutTSMViewController.h"
#import "PersonalDataViewController.h"
@interface SetMyTSMViewController ()
@property (weak, nonatomic) IBOutlet X_TableView *tableView;

@end

@implementation SetMyTSMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden  = NO;
    self.title = @"设置";
    NSArray *titleArr = @[@"关于我们",@"意见反馈",@"清除缓存"];
    NSMutableArray *arr=[[NSMutableArray alloc]init];


    [arr addObject:[@{
                      kCellTag:@"line",
                      kCellDidSelect:@"f1",
                      @"color":RGB(242, 242, 242),
                      @"h":@"10",
                      } mutableCopy]];
    [arr addObject:[@{
                          kCellTag:@"SetTSMCell",
                          kCellDidSelect:@"setTSMCell",
                          @"color":[UIColor whiteColor],
                          @"setTSM_textLab":[titleArr objectAtIndex:0],
                          @"h":@"44",
                          } mutableCopy]];
        

    
        [arr addObject:[@{
                          kCellTag:@"ThinLine",
                          kCellDidSelect:@"f1",
                          @"l":@"12",
                          } mutableCopy]];
        [arr addObject:[@{
                          kCellTag:@"SetTSMCell",
                          kCellDidSelect:@"setTSMCell",
                          @"color":[UIColor whiteColor],
                          @"setTSM_textLab":[titleArr objectAtIndex:1],
                          @"h":@"44",
                          } mutableCopy]];
       [arr addObject:[@{
                      kCellTag:@"line",
                      kCellDidSelect:@"f1",
                      @"color":RGB(242, 242, 242),
                      @"h":@"10",
                      } mutableCopy]];
    [arr addObject:[@{
                      kCellTag:@"SetTSMCell",
                      kCellDidSelect:@"setTSMCell",
                      @"color":[UIColor whiteColor],
                      @"setTSM_textLab":[titleArr objectAtIndex:2],
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
                      @"exitLogin_btn":@"退出登录",
                      @"loginBtnColor":VioletSubColor,
                      @"h":@"45",
                      } mutableCopy]];
    
    
    self.tableView.xDataSource = arr;
    
    [arr x_update:@"SetTSMCell" where:@{@"setTSM_textLab":@"关于我们"} set:@{kCellDidSelect:@"aboutMyTSM"}];
    [self.tableView addCellEventListenerWithName:@"aboutMyTSM" block:^(X_TableViewCell *cell) {
        AboutTSMViewController *aboutMyTSMVC = [AboutTSMViewController new];
        [self.navigationController pushViewController:aboutMyTSMVC animated:YES];
    }];
    [arr x_update:@"SetTSMCell" where:@{@"setTSM_textLab":@"清除缓存"} set:@{kCellDidSelect:@"deleteMyTSM"}];
    [self.tableView addCellEventListenerWithName:@"deleteMyTSM" block:^(X_TableViewCell *cell) {
        PersonalDataViewController *personalDataVC = [PersonalDataViewController new];
        [self.navigationController pushViewController:personalDataVC animated:YES];
    }];

    
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
