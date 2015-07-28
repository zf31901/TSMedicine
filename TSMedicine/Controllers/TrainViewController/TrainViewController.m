//
//  TrainViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-26.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "TrainViewController.h"

@interface TrainViewController ()
@property (weak, nonatomic) IBOutlet X_TableView *tableView;

@end

@implementation TrainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden  = NO;

    self.title = @"我的培训";
    NSArray *titleArr = @[@"待考核",@"待考核",@"",@"考核通过"];
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i = 0; i <titleArr.count; i++) {
        [arr addObject:[@{
                          kCellTag:@"MyShenqingCell",
                          kCellDidSelect:@"MyShenqingCell",
                          @"waitBtnTitle":[titleArr objectAtIndex:i],
                          @"color":[UIColor whiteColor],
                          @"h":@"88",
                          } mutableCopy]];
        [arr addObject:[@{
                          kCellTag:@"ThinLine",
                          kCellDidSelect:@"f1",
                          @"l":@"12",
                          } mutableCopy]];
        
    }
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
