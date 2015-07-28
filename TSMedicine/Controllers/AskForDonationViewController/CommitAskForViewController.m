//
//  CommitAskForViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-19.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "CommitAskForViewController.h"

@interface CommitAskForViewController ()
@property (weak, nonatomic) IBOutlet X_TableView *tableView;

@end

@implementation CommitAskForViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"申请捐助";
    NSArray *titleArr = @[@"姓名",@"身份证",@"地址",@"通讯住址"];
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i = 0; i <titleArr.count; i++) {
        [arr addObject:[@{
                          kCellTag:@"AskForCell",
                          kCellDidSelect:@"AskForCell",
                          @"nameLab":[titleArr objectAtIndex:i],
                          @"detaillab":@"",
                          @"rightImgHidden":i== 2?@NO:@YES,
                          } mutableCopy]];
        [arr addObject:[@{
                          kCellTag:@"ThinLine",
                          kCellDidSelect:@"f1",
                          @"l":@"12",
                          } mutableCopy]];
        
    }
    self.tableView.xDataSource = arr;
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
