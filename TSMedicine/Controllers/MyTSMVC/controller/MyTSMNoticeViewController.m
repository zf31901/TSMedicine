//
//  MyTSMNoticeViewController.m
//  TSMedicine
//
//  Created by lyy on 15-8-5.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "MyTSMNoticeViewController.h"
#define URL @"http://app.aixinland.cn//page/notice_detail"

@interface MyTSMNoticeViewController ()<UIWebViewDelegate>
{
    UIWebView *_webView;
    

}
@end

@implementation MyTSMNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavView];
    
    _webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W,SCREEN_H- 64)];
    
    NSString *url=[NSString stringWithFormat:@"%@",URL];
    NSLog(@"url1234------%@",url);
    
    [_webView  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    [_webView  sizeToFit];
    [self.view addSubview:_webView];

    
    
}

-(void)setNavView
{
    self.navigationController.navigationBarHidden = NO;
    self.title = @"系统通知";
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
