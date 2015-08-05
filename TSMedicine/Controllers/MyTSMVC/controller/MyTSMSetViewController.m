//
//  MyTSMSetViewController.m
//  TSMedicine
//
//  Created by lyy on 15-8-5.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "MyTSMSetViewController.h"

@interface MyTSMSetViewController ()

@end

@implementation MyTSMSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavView];
    
}

-(void)setNavView
{
    self.navigationController.navigationBarHidden = NO;
    self.title = @"设置";
}


- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
