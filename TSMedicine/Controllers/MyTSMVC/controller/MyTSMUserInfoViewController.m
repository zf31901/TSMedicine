//
//  MyTSMUserInfoViewController.m
//  TSMedicine
//
//  Created by lyy on 15-8-4.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "MyTSMUserInfoViewController.h"
#import "MyUserInfoView.h"

NSString *const UserInfoView = @"MyUserInfoView";
@interface MyTSMUserInfoViewController ()

@property (nonatomic,strong) MyUserInfoView *infoView;

@end

@implementation MyTSMUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavView];
    
    [self createUI];
    
}

-(void)setNavView
{
    self.navigationController.navigationBarHidden = NO;
    self.title = @"个人资料";
    
}
-(void)createUI
{
    _infoView = [[[NSBundle mainBundle] loadNibNamed:UserInfoView owner:self options:nil] lastObject];
    _infoView.frame = CGRectMake(0, 0, ScreenWidth, 286);
    [self.view addSubview:_infoView];
    
    [_infoView.headImageView sd_setImageWithURL:[NSURL URLWithString:UserInfoData.headPic] placeholderImage:[UIImage imageNamed:default_head] options:SDWebImageRefreshCached];
    
    _infoView.sexLab.text = @"男";
    _infoView.ageLab.text = @"25";
    _infoView.phoneLab.text = [NSString stringWithFormat:@"%@",UserInfoData.phone];
    _infoView.addreLab.text = @"广东";
    _infoView.streetLab.text = @"蛇口大道";
    
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
