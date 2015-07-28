//
//  ReportViewContrlller.m
//  TSMedicine
//
//  Created by lyy on 15-6-26.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "ReportViewContrlller.h"

@interface ReportViewContrlller ()

@end

@implementation ReportViewContrlller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"举报患者";
    [self buidRightBtn:@"提交"];
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
