//
//  DonationViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-8.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "DonationViewController.h"
#import "AskForDonationViewController.h"
@interface DonationViewController ()
@property (weak, nonatomic) IBOutlet X_TableView *tableView;

@end

@implementation DonationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"捐助项目";
    
    NSArray *titleArr = @[@"性别",@"年龄",@"手机号",@"地址",@"街道"];
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    
    

    for (int i = 0; i < titleArr.count; i ++)
    {

        [arr addObject:[@{
                          kCellTag:@"DonationCell",
                          kCellDidSelect:@"DonationCell",
                          @"titleLab":@"项目名称一",
                          @"contentlab":@"适应概述内容适应概述内容",
                          @"unitlab":@"发起单位：第三人民医院",
                          @"imgView":@"NEWS50_PRESS",
                          } mutableCopy]];
        [arr addObject:[@{
                          kCellTag:@"ThinLine",
                          kCellDidSelect:@"f1",
                          @"l":@"12",
                          } mutableCopy]];
        
    }
    
    self.tableView.xDataSource = arr;
    WEAKSELF
    [self.tableView addCellEventListenerWithName:@"DonationCell" block:^(X_TableViewCell *cell) {
        
        NSIndexPath *indexPath = [weakSelf.tableView indexPathForCell:cell];
        NSLog(@"-----cell-->>\n%ld",(long)indexPath.row);
        
        AskForDonationViewController *askVC = [AskForDonationViewController new];
        askVC.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:askVC animated:YES];
    }];
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
