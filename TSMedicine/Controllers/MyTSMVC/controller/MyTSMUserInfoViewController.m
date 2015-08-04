//
//  MyTSMUserInfoViewController.m
//  TSMedicine
//
//  Created by lyy on 15-8-4.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "MyTSMUserInfoViewController.h"

@interface MyTSMUserInfoViewController ()

@property (nonatomic,strong) NSMutableArray *dataArr;

@end

@implementation MyTSMUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavView];

}

-(void)setNavView
{
    self.navigationController.navigationBarHidden = NO;
    self.title = @"个人资料";
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
