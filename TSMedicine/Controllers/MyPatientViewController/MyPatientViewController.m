//
//  MyPatientViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-16.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "MyPatientViewController.h"
#import "MyPatientCell.h"
#import "ReportViewContrlller.h"
@interface MyPatientViewController ()
@property (weak, nonatomic) IBOutlet X_TableView *tableView;

@end

@implementation MyPatientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden  = NO;

    self.title = @"我的患者";
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i = 0; i <5; i++) {
        [arr addObject:[@{
                          kCellTag:@"MyPatientCell",
                          kCellDidSelect:@"MyPatient",
                          @"color":[UIColor whiteColor],
                          @"nameLab":@"张三",
                          @"phoneNumLab":@"手机   18954689769",
                          @"reportLab":i== 0?@"被举报":@"举报",
                          @"reportLabColor":i== 0?RGB(255, 102, 0):RGBS(146),
                          } mutableCopy]];
        [arr addObject:[@{
                          kCellTag:@"ThinLine",
                          kCellDidSelect:@"f1",
                          @"l":@"12",
                          } mutableCopy]];

    }
     self.tableView.xDataSource = arr;
    [arr x_update:@"MyPatientCell" where:@{@"reportLab":@"举报"} set:@{kCellDidSelect:@"MyPatientcell"}];
    [self.tableView addCellEventListenerWithName:@"MyPatientcell" block:^(X_TableViewCell *cell) {
        ReportViewContrlller *reportVC = [ReportViewContrlller new];
        [self.navigationController pushViewController:reportVC animated:YES];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
