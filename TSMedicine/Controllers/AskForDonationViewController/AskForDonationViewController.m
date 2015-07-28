//
//  AskForDonationViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-19.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "AskForDonationViewController.h"
#import "CommitAskForViewController.h"
@interface AskForDonationViewController ()

@end

@implementation AskForDonationViewController

- (void)viewDidLoad { 
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"申请捐助";
    self.askForDonation_nextpageBtn.layer.borderWidth = 1;
    self.askForDonation_nextpageBtn.layer.borderColor = RGB(159,115,230).CGColor;
    self.askForDonation_nextpageBtn.layer.cornerRadius = 4;
    self.askForDonation_nextpageBtn.layer.masksToBounds = YES;
    [self.askForDonation_nextpageBtn addTarget:self action:@selector(nextpageVC) forControlEvents:UIControlEventTouchUpInside];
    
      
}
- (void)nextpageVC
{
    CommitAskForViewController *commitVC = [CommitAskForViewController new];
    [self.navigationController pushViewController:commitVC animated:YES];
    
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
