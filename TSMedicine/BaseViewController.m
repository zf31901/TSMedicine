//
//  BaseViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-10.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController.navigationBar setBarTintColor:VioletColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:RGBS(255), NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    [self buidLeftBtn];
   
}
- (void)buidLeftBtn
{
    if((int)[self.navigationController.viewControllers count]!=1)
    {
        UIButton *btn = [UIButton buttonWithType:0];
        [btn setImage:[UIImage imageNamed:@"arrow-left26x42_white"] forState:0];
        btn.frame = CGRectMake(0, 0, 60, 120);
        [btn setTitle:@"返回" forState:0];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:18]];
        [btn setTitleColor:[UIColor whiteColor] forState:0];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -8, 0,40);
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -23, 0, 0);
    }
}
- (void)buidRightBtn:(NSString *)title
{
    if((int)[self.navigationController.viewControllers count]!=1)
    {
        UIButton *btn = [UIButton buttonWithType:0];
        btn.frame = CGRectMake(0, 0, 60, 120);
        [btn setTitle:title forState:0];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:18]];
        [btn setTitleColor:[UIColor whiteColor] forState:0];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [btn addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -8, 0,40);
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 23, 0, 0);
    }
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)commit
{
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
