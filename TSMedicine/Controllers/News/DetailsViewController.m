//
//  DetailsViewController.m
//  TSMedicine
//
//  Created by 123 on 15/7/29.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "DetailsViewController.h"
#import "NewsModel.h"
#import "NewsTableViewCell.h"

#define URLisr @"http://app.aixinland.cn//page/news_detail.html?dataId=3"


@interface DetailsViewController ()<UITableViewDataSource,UITableViewDelegate,UIWebViewDelegate>
{
    UIWebView *_webView;
    UIScrollView *_scrollview;
    NSMutableArray *_dataArr;
    NSString *terr;
}


@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr=[[NSMutableArray alloc]init];
    
     self.view.userInteractionEnabled = YES;
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController.navigationBar setBarTintColor:VioletColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:RGBS(255), NSFontAttributeName:[UIFont systemFontOfSize:18]};
    UILabel *lable=[[UILabel alloc]initWithFrame: CGRectMake(self.view.frame.size.width/2-15, 18, 30, 20)];
    lable.text=@"详情";
    [lable setTextColor:[UIColor whiteColor]];
    lable.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:22];
     self.navigationItem.titleView = lable;
    
    
    [self  caselable];
    [self  buidLeftBtn];
    [self UIlable];
    
    
}

-(void)UIlable{
    _webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W,SCREEN_H- 64)];
//SCREEN_H- TOPBAR- BOTTOMBAR
    _webView.delegate=self;
//    _webView.scrollView.bounces=NO;
//    _webView.scrollView.showsHorizontalScrollIndicator=NO;
//    _webView.scrollView.scrollEnabled=NO;
   
    NSString *url=[NSString stringWithFormat:URLisr,terr];
    NSLog(@"url------%@",url);
   
   [_webView  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
     [_webView  sizeToFit];
    [self.view addSubview:_webView];
    
   // [self loadLable];
    

}
-(void)loadLable{
  
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
    [dic setObject:@"1"              forKey:@"pageid"];
    [dic setObject:@"3"      forKey:@"pagesize"];
    
   
    YYHttpRequest *hq = [[YYHttpRequest alloc] init];
   [hq  GETURLString:@"http://app.aixinland.cn//page/news_detail.html?dataId=%@" parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObj) {
        
        if ([responseObj objectForKey:@"data"] !=nil)
        {
            NSArray *dataArr =[responseObj objectForKey:@"data"];
            for (int i = 0; i < dataArr.count; i ++)
            {
                NewsModel *newModel = [[NewsModel alloc] init];
                NSDictionary *dataDic = (NSDictionary *)[dataArr objectAtIndex:i];
                newModel.a_Content = [dataDic objectForKey:@"a_Content"];
                
            }
            
           // [_mytableView reloadData];
            
        }
   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
       NSLog(@"%@",error);
       
   }];

    

}
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}
-(void)caselable{



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
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *urlString = [[request URL] absoluteString];
    NSLog(@"urlString---  %@",urlString);
    return YES;
}

@end
