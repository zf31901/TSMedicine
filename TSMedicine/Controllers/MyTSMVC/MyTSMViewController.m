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
#import "MyTSMUserInfoViewController.h"

#import "MyHeaderView.h"
#import "MyProModel.h"
#import "MyProTableViewCell.h"


NSString *const ProTableViewCell = @"MyProTableViewCell";

@interface MyTSMViewController ()<MyHeaderViewDelegate,UITableViewDataSource,UITableViewDelegate>

//@property (weak, nonatomic) IBOutlet X_TableView *tableView;

@property (strong,nonatomic) MyHeaderView *headView;

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) NSMutableArray *dataArr;

@end

@implementation MyTSMViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden  = YES;
    if ([GlobalMethod sharedInstance].isLogin){
        [_headView.headImageView sd_setImageWithURL:[NSURL URLWithString:UserInfoData.headPic] placeholderImage:[UIImage imageNamed:default_head] options:SDWebImageRefreshCached];
        _headView.nameLab.text = [NSString stringWithFormat:@"%@",UserInfoData.im];
        
        [self.view addSubview:self.tableView];
        
        [_tableView registerNib:[UINib nibWithNibName:ProTableViewCell bundle:nil] forCellReuseIdentifier:ProTableViewCell];
        
         [self loadData];
    }
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _headView.maxY, ScreenWidth, ScreenHeight - _headView.maxY) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.bounces = NO;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self createUI];
    
}

-(void)createUI
{
    _headView = [[MyHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
    _headView.delegate = self;
    [self.view addSubview:_headView];
}
#pragma mark -------UITableViewDataSource-----
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArr[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyProTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProTableViewCell];
    if (!cell) {
        cell = [[MyProTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ProTableViewCell];
    }
    cell.model = _dataArr[indexPath.section][indexPath.row];
    
    return cell;
}

#pragma mark --------UITableViewDelegate--------------
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}


#pragma mark ------------ 数据 ---------------
-(void)loadData
{
    _dataArr = [NSMutableArray array];
    
    NSArray *picArr = [NSArray arrayWithObjects:@"appl40", @"questions40",@"notice40",@"Set-up40",nil];
    NSArray *titleArr = [NSArray arrayWithObjects:@"我的申请", @"我的提问",@"系统通知",@"设置",nil];
    
    NSMutableArray *arr1 = [NSMutableArray array];
    for (int i = 0; i < 2; i++) {
        MyProModel *model = [[MyProModel alloc] init];
        model.pic = picArr[i];
        model.title = titleArr[i];
        if (i == 1) {
            model.msg = [NSString stringWithFormat:@"%d",i];
        }
        [arr1 addObject:model];
    }
    
    NSMutableArray *arr2 = [NSMutableArray array];
    for (int i = 2; i < 4; i++) {
        MyProModel *model = [[MyProModel alloc] init];
        model.pic = picArr[i];
        model.title = titleArr[i];
        [arr2 addObject:model];
    }
    
    [_dataArr addObject:arr1];
    [_dataArr addObject:arr2];
    
    [_tableView reloadData];
}
#pragma mark ---------MyHeaderViewDelegate--------
-(void)myHeaderViewClick:(MyHeaderView *)headerView
{
    
    if ([GlobalMethod sharedInstance].isLogin) {

        MyTSMUserInfoViewController *infoVC = [[MyTSMUserInfoViewController alloc] init];
        infoVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:infoVC animated:YES];
        
    }else{
        
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        loginVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:loginVC animated:YES];
    }
    
}

/*
 
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
 
 
 [self.tableView addCellEventListenerWithName:@"setMyTSMHeader_photoImg" block:^(X_TableViewCell *cell) {
 [arr x_update:@"MyTSMHeaderCell" where:@{@"h":@"154"} set:@{@"myTSMHeader_photoImg":RGB(32, 164, 82),@"sigOutBtnEnagled":@"true",}];
 [self.tableView  reloadData];
 
 }];
 
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
