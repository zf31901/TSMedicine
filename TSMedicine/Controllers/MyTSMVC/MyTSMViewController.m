//
//  MyTSMViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-8.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "MyTSMViewController.h"
#import "SetMyTSMViewController.h"
#import "MyPatientViewController.h"
#import "MyShenqingViewContrlller.h"
#import "TrainViewController.h"

#import "PhoneVerificationCodeViewController.h"

#import "LoginViewController.h"

@interface MyTSMViewController ()
@property (weak, nonatomic) IBOutlet X_TableView *tableView;

@end

@implementation MyTSMViewController
- (void)viewWillAppear:(BOOL)animated
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden  = YES;
    WEAKSELF
//    NSArray *titleArr = @[@"我的申请",@"我的提问",@"系统通知",@"设置"];
    NSArray *titleArr = @[@"我的患者",@"我的培训",@"我的问答",@"系统通知",@"设置"];

    NSArray *imgArr = @[@"patient40",@"training40",@"answer40",@"notice40",@"Set-up40"];
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    [arr addObject:[@{
                      kCellTag:@"MyTSMHeaderCell",
                      kCellDidSelect:@"myTSMphotoImg",
                      @"color":RGB(145, 92, 100),
                      @"h":@"154",
                      } mutableCopy]];
    
    [arr addObject:[@{
                      kCellTag:@"line",
                      kCellDidSelect:@"f1",
                      @"color":RGB(242, 242, 242),
                      @"h":@"10",
                      } mutableCopy]];
    [arr addObject:[@{
                      kCellTag:@"ThinLine",
                      kCellDidSelect:@"f1",
                      @"l":@"0",
                      } mutableCopy]];
    
    [arr addObject:[@{
                      kCellTag:@"MyTSMListCell",
                      kCellDidSelect:@"myTSMListCell",
                      @"color":[UIColor whiteColor],
                      @"textlab":[titleArr objectAtIndex:0],
                      @"redLab":@"1",
                      @"imgView":[imgArr objectAtIndex:0],
                      @"redLabHidden":@YES,
                      @"h":@"44",
                      } mutableCopy]];
    [arr addObject:[@{
                      kCellTag:@"ThinLine",
                      kCellDidSelect:@"f1",
                      @"l":@"44",
                      } mutableCopy]];
    [arr addObject:[@{
                      kCellTag:@"MyTSMListCell",
                      kCellDidSelect:@"myTSMListCell",
                      @"color":[UIColor whiteColor],
                      @"h":@"44",
                      @"textlab":[titleArr objectAtIndex:1],
                      @"redLab":@"1",
                      @"imgView":[imgArr objectAtIndex:1],
                      @"redLabHidden":@NO,
                      } mutableCopy]];
    [arr addObject:[@{
                      kCellTag:@"ThinLine",
                      kCellDidSelect:@"f1",
                      @"l":@"44",
                      } mutableCopy]];
    [arr addObject:[@{
                      kCellTag:@"MyTSMListCell",
                      kCellDidSelect:@"myTSMListCell",
                      @"color":[UIColor whiteColor],
                      @"h":@"44",
                      @"textlab":[titleArr objectAtIndex:2],
                      @"redLab":@"1",
                      @"imgView":[imgArr objectAtIndex:2],
                      @"redLabHidden":@YES,
                      } mutableCopy]];
    [arr addObject:[@{
                      kCellTag:@"line",
                      kCellDidSelect:@"f1",
                      @"color":RGB(242, 242, 242),
                      @"h":@"10",
                      } mutableCopy]];
    [arr addObject:[@{
                      kCellTag:@"MyTSMListCell",
                      kCellDidSelect:@"myTSMListCell",
                      @"color":[UIColor whiteColor],
                      @"h":@"44",
                      @"textlab":[titleArr objectAtIndex:3],
                      @"redLab":@"1",
                      @"imgView":[imgArr objectAtIndex:3],
                      @"redLabHidden":@YES,
                      } mutableCopy]];
    [arr addObject:[@{
                      kCellTag:@"ThinLine",
                      kCellDidSelect:@"f1",
                      @"l":@"44",
                      } mutableCopy]];
    [arr addObject:[@{
                      kCellTag:@"MyTSMListCell",
                      kCellDidSelect:@"myTSMListCell",
                      @"color":[UIColor whiteColor],
                      @"h":@"44",
                      @"textlab":[titleArr objectAtIndex:4],
                      @"redLab":@"1",
                      @"imgView":[imgArr objectAtIndex:4],
                      @"redLabHidden":@YES,
                      } mutableCopy]];
    
    self.tableView.xDataSource = arr;
    [arr x_update:@"MyTSMListCell" where:@{@"textlab":@"我的患者"} set:@{kCellDidSelect:@"myPatientVC"}];
    [self.tableView addCellEventListenerWithName:@"myPatientVC" block:^(X_TableViewCell *cell) {
        MyPatientViewController *myPatientVC = [MyPatientViewController new];
        myPatientVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myPatientVC animated:YES];
    }];
    [arr x_update:@"MyTSMListCell" where:@{@"textlab":@"我的培训"} set:@{kCellDidSelect:@"MyShenqingVC"}];
    [self.tableView addCellEventListenerWithName:@"MyShenqingVC" block:^(X_TableViewCell *cell) {
        TrainViewController *trainVC = [TrainViewController new];
        trainVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:trainVC animated:YES];
    }];
    [arr x_update:@"MyTSMListCell" where:@{@"textlab":@"我的问答"} set:@{kCellDidSelect:@"answerVC"}];
    [self.tableView addCellEventListenerWithName:@"answerVC" block:^(X_TableViewCell *cell) {
        MyShenqingViewContrlller *myShenqingVC = [MyShenqingViewContrlller new];
        myShenqingVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myShenqingVC animated:YES];
    }];
    [self.tableView addCellEventListenerWithName:@"setMyTSMHeader_photoImg" block:^(X_TableViewCell *cell) {
        [YYPhotoPicker showPhotoInController:self withCallBack:^(UIImage *image) {
            [cell.cellData setObject:image forKey:@"myTSMHeader_photoImg"];
            [weakSelf.tableView reloadData];
        }];
    }];
    [arr x_update:@"MyTSMListCell" where:@{@"textlab":@"系统通知"} set:@{kCellDidSelect:@"push"}];
    [self.tableView addCellEventListenerWithName:@"push" block:^(X_TableViewCell *cell) {
        PhoneVerificationCodeViewController *phone = [PhoneVerificationCodeViewController new];
        phone.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:phone animated:YES];
    }];
    [self.tableView addCellEventListenerWithName:@"loginBtn" block:^(X_TableViewCell *cell) {
        LoginViewController *loginVC = [LoginViewController new];
        loginVC.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:loginVC animated:YES];
       
    }];
     [arr x_update:@"MyTSMListCell" where:@{@"textlab":@"设置"} set:@{kCellDidSelect:@"setMyTSM"}];
    [self.tableView addCellEventListenerWithName:@"setMyTSM" block:^(X_TableViewCell *cell) {
        SetMyTSMViewController *setMyTSMVC = [SetMyTSMViewController new];
        setMyTSMVC.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:setMyTSMVC animated:YES];
    }];
     


    /*
    [self.tableView addCellEventListenerWithName:@"setMyTSMHeader_photoImg" block:^(X_TableViewCell *cell) {
        [arr x_update:@"MyTSMHeaderCell" where:@{@"h":@"154"} set:@{@"myTSMHeader_photoImg":RGB(32, 164, 82),@"sigOutBtnEnagled":@"true",}];
        [self.tableView  reloadData];
        
    }];*/
    
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
