//
//  AboutTSMViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-12.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "AboutTSMViewController.h"

@interface AboutTSMViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *about_imgView;

@end

@implementation AboutTSMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"关于我们";
    self.about_imgView.layer.cornerRadius = 10;
    self.about_imgView.layer.masksToBounds = YES;
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
