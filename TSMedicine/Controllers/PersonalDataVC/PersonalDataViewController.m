//
//  PersonalDataViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-12.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "PersonalDataViewController.h"

@interface PersonalDataViewController ()<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet X_TableView *tableView;

@end

@implementation PersonalDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"个人资料";
     NSArray *titleArr = @[@"性别",@"年龄",@"手机号",@"地址",@"街道"];
    NSArray *detailArr = @[@"女",@"38",@"167868780",@"花园城",@"8楼"];
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    
    
    
    [arr addObject:[@{
                      kCellTag:@"PersonalDataCell",
                      kCellDidSelect:@"personalData",
                      @"color":[UIColor whiteColor],
                      @"textlab":@"头像",
                      } mutableCopy]];
    for (int i = 0; i < titleArr.count; i ++)
    {
        [arr addObject:[@{
                          kCellTag:@"ThinLine",
                          kCellDidSelect:@"f1",
                          @"l":@"12",
                          } mutableCopy]];
        [arr addObject:[@{
                          kCellTag:@"PersonalCell",
                          kCellDidSelect:@"Personal",
                          @"color":[UIColor whiteColor],
                          @"textlab":[titleArr objectAtIndex:i],
                          @"detailLab":[detailArr objectAtIndex:i],
                          @"h":@"44",
                          } mutableCopy]];
        
    }
    [arr addObject:[@{
                      kCellTag:@"ThinLine",
                      kCellDidSelect:@"f1",
                      @"l":@"0",
                      } mutableCopy]];

    
    self.tableView.xDataSource = arr;    WEAKSELF
    
    [arr x_update:@"PersonalCell" where:@{@"textlab":@"性别"} set:@{kCellDidSelect:@"selectSex"}];
    [self.tableView addCellEventListenerWithName:@"selectSex" block:^(X_TableViewCell *cell) {
        UIActionSheet *aSheet = [[UIActionSheet alloc] initWithTitle:@"请选择"
                                                            delegate:self
                                                   cancelButtonTitle:@"取消"
                                              destructiveButtonTitle:nil
                                                   otherButtonTitles:@"男",@"女", nil];
        [aSheet showInView:self.view];
        self.actionSheetButtonTitle = ^(NSString *sex){
            [cell.cellData setObject:sex forKey:@"detailLab"];
            [weakSelf.tableView reloadData];
        } ;
    }];


}
#pragma mark - UIActionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (self.actionSheetButtonTitle) {
        self.actionSheetButtonTitle([actionSheet buttonTitleAtIndex:buttonIndex]);
    }
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
