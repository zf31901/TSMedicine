//
//  NewsViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-10.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
@interface NewsViewController ()

@property (weak, nonatomic) IBOutlet X_TableView *tableview;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.title = @"新闻";
//    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H- TOPBAR- BOTTOMBAR)];
//    [self.view addSubview:web];
//    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.ewt.cc"]]];
    
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSMutableArray *testArr = [NSMutableArray array];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
    [dic setObject:@"1"              forKey:@"pageid"];
    [dic setObject:@"3"      forKey:@"pagesize"];
    WEAKSELF
    YYHttpRequest *hq = [[YYHttpRequest alloc] init];
    [hq POSTURLString:@"http://app.aixinland.cn/api/news/List2" parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([responseObject objectForKey:@"data"] !=nil)
        {
            NSArray *dataArr =[responseObject objectForKey:@"data"];
            for (int i = 0; i < dataArr.count; i ++)
            {
                NewsModel *newModel = [[NewsModel alloc] init];
                NSDictionary *dataDic = (NSDictionary *)[dataArr objectAtIndex:i];
                newModel.a_Title = [dataDic objectForKey:@"a_Title"];
                newModel.a_From = [dataDic objectForKey:@"a_From"];
                newModel.a_AddDate = [dataDic objectForKey:@"a_AddDate"];
                [testArr addObject:newModel];
        
//                NSLog(@"rqdic----%@",dataDic);
                
                [arr addObject:[@{
                                  kCellTag:@"NewsTableViewCell",
                                  kCellDidSelect:@"NewsTableView",
                                  @"color":[UIColor whiteColor],
                                  @"newlab":[dataDic objectForKey:@"a_Title"],
                                  @"fromLab":[dataDic objectForKey:@"a_From"],
                                  @"dataTimelab":[dataDic objectForKey:@"a_AddDate"],
                                  @"h":@"80",
                                  } mutableCopy]];
                
            }
            weakSelf.tableview.xDataSource = arr;
            [weakSelf.tableview reloadData];
            
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    /*
    [hq GETURLString:@"http://app.aixinland.cn/api/news/List?pageid=1&pagesize=2" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObj) {
        NSDictionary *rqDic = (NSDictionary *)responseObj;
        NSLog(@"rqdic----%@",responseObj);
        
        if ([rqDic objectForKey:@"data"] !=nil)
        {
            NSArray *dataArr =[rqDic objectForKey:@"data"];
            for (int i = 0; i < dataArr.count; i ++)
            {
                NewsModel *newModel = [[NewsModel alloc] init];
                NSDictionary *dataDic = (NSDictionary *)[dataArr objectAtIndex:i];
                newModel.a_Title = [dataDic objectForKey:@"a_Title"];
                newModel.a_From = [dataDic objectForKey:@"a_From"];
                newModel.a_AddDate = [dataDic objectForKey:@"a_AddDate"];
                [testArr addObject:newModel];
                
                
                NSLog(@"rqdic----%@",dataDic);
                [arr addObject:[@{
                                  kCellTag:@"NewsTableViewCell",
                                  kCellDidSelect:@"NewsTableView",
                                  @"color":[UIColor whiteColor],
                                  @"newlab":[dataDic objectForKey:@"a_Title"],
                                  @"fromLab":[dataDic objectForKey:@"a_From"],
                                  @"dataTimelab":[dataDic objectForKey:@"a_AddDate"],
                                  @"h":@"80",
                                  } mutableCopy]];
                
            }
            weakSelf.tableview.xDataSource = arr;
            [weakSelf.tableview reloadData];
            
            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@ , %@",operation,error);
    }];
*/
    
    /*
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    NSMutableArray *testArr = [NSMutableArray array];
    WEAKSELF
    YYHttpRequest *hq = [YYHttpRequest shareInstance];
    [hq GETURLString:@"http://app.aixinland.cn/api/news/List?pageid=1&pagesize=2" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObj) {
        NSDictionary *rqDic = (NSDictionary *)responseObj;
        NSLog(@"rqdic----%@",responseObj);

        if ([rqDic objectForKey:@"data"] !=nil)
       {
           NSArray *dataArr =[rqDic objectForKey:@"data"];
           for (int i = 0; i < dataArr.count; i ++)
           {
               NewsModel *newModel = [[NewsModel alloc] init];
               NSDictionary *dataDic = (NSDictionary *)[dataArr objectAtIndex:i];
               newModel.a_Title = [dataDic objectForKey:@"a_Title"];
               newModel.a_From = [dataDic objectForKey:@"a_From"];
               newModel.a_AddDate = [dataDic objectForKey:@"a_AddDate"];
               [testArr addObject:newModel];
               

               NSLog(@"rqdic----%@",dataDic);
               [arr addObject:[@{
                                 kCellTag:@"NewsTableViewCell",
                                 kCellDidSelect:@"NewsTableView",
                                 @"color":[UIColor whiteColor],
                                 @"newlab":[dataDic objectForKey:@"a_Title"],
                                 @"fromLab":[dataDic objectForKey:@"a_From"],
                                 @"dataTimelab":[dataDic objectForKey:@"a_AddDate"],
                                 @"h":@"80",
                                 } mutableCopy]];

           }
           weakSelf.tableview.xDataSource = arr;
           [weakSelf.tableview reloadData];
           

        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@ , %@",operation,error);
    }];
*/
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
