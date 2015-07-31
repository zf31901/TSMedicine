//
//  NewsViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-10.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet X_TableView *tableview;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    mytableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height)];
    //    mytableView.dataSource=self;
    //    mytableView.delegate=self;
    //    [self.view addSubview:mytableView];
    
    self.title = @"新闻";
    // [self  lale];
    //    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H- TOPBAR- BOTTOMBAR)];
    //    [self.view addSubview:web];
    //    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.ewt.cc"]]];
    [self UILABLE];
    
    
}
-(void)UILABLE{
    
    
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
    
    [hq POSTURLString:@"http:app.aixinland.cn/api/news/List2" parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"dataArray=====%@",[responseObject objectForKey:@"data"]);
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
                
                newModel.a_SmallImg=[dataDic objectForKey:@"a_SmallImg"];
                
                [testArr addObject:newModel];
                
                
                NSLog(@"rqdic678----%@",dataDic);
                [arr addObject:[@{
                                  kCellTag:@"NewsTableViewCell",
                                  kCellDidSelect:@"NewsTableView",
                                  @"color":[UIColor whiteColor],
                                  @"newlab":[dataDic objectForKey:@"a_Title"],
                                  @"fromLab":[dataDic objectForKey:@"a_From"],
                                  @"dataTimelab":[dataDic objectForKey:@"a_AddDate"],@"image":[dataDic objectForKey:@"a_SmallImg"],@"h":@"120",
                                  } mutableCopy]];
                
            }
            weakSelf.tableview.xDataSource = arr;
            [weakSelf.tableview reloadData];
        }
        
        [self lale];
        
        
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
-(void)lale{
    WEAKSELF
    [self.tableview addCellEventListenerWithName:@"NewsTableViewCell" block:^(X_TableViewCell *cell) {
        
        NSIndexPath *indexPath = [weakSelf.tableview indexPathForCell:cell];
        NSLog(@"-----cell-->>\n%ld",(long)indexPath.row);
        
        DetailsViewController *askVC = [[DetailsViewController alloc]init];
        askVC.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:askVC animated:YES];
    }];
    
}
#pragma mark - UITableViewDelegate
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    if(mytableView )
//    {
//        return 1;
//    }
//    else
//    {
//        return dataArr.count;
//    }
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    if(mytableView){
//        return 4;
//    }
//    else
//    {
//        return 1;
//    }
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if(mytableView == self.tableView){
//        if (section != 2) {
//            return 0;
//        }
//        else
//            return 70;
//    }
//    else
//        return 0;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    if (mytableView== self.tableView) {
//        if (section == 1) {
//            return 20;
//        }
//        else
//            return 0;
//    }
//    else
//        return 0;
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return nil;
//}
//
//- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (mytableView) {
//        return [super tableView:tableView cellForRowAtIndexPath:indexPath.row];
//    }
//    else
//    {
//       NewsModel *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsTableViewCell"];
//        if(indexPath.row >= dataArr.count)
//            return cell;
//
//    }
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (tableView == self.tableView) {
//        if (indexPath.section == 1 && indexPath.row == 0) {
//            return CGRectGetHeight(descriptionLabel.frame) + 16;
//        }
//        if (indexPath.row == 0 && indexPath.section == 2) {
//            return 44.0 * dataArr.count;
//        }
//        else
//            return [super tableView:mytableView heightForRowAtIndexPath:indexPath];
//    }
//    else
//        return 44.0;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
