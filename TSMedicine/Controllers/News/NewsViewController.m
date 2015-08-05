//
//  NewsViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-10.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "DetailsViewController.h"
#import "NewsTableViewCell.h"
#import "newCell.h"

#import "UIImageView+AFNetworking.h"

@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    NSMutableArray  *brr;
    NSMutableArray  *arr;
    
    NSMutableArray *_dataArr;
    UITableView *_mytableView;
    
    
    
    
}


@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr=[[NSMutableArray alloc]init];
    
    _mytableView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _mytableView.delegate =self;
    _mytableView.dataSource =self;
    
    [_mytableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"NewsCell"];
    
    [_mytableView registerNib:[UINib nibWithNibName:@"newCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:_mytableView];
    
    
    self.title = @"新闻";
    // [self  lale];
//       UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H- TOPBAR- BOTTOMBAR)];
//        [self.view addSubview:web];
//        [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.ewt.cc"]]];
    
   [self UILABLE];
   
    
    
}
-(void)UILABLE{
    
    
    
    arr = [[NSMutableArray alloc] init];
    brr=[[NSMutableArray alloc]init];
    
  
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
    [dic setObject:@"1"              forKey:@"pageid"];
    [dic setObject:@"3"      forKey:@"pagesize"];

    YYHttpRequest *hq = [[YYHttpRequest alloc] init];
    
    [hq POSTURLString:@"http://app.aixinland.cn/api/news/List2" parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
//       NSLog(@"12390---%@",responseObject);
        
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
                [_dataArr addObject:newModel];
                
             //   NSLog(@"rqdic1111----%@",dataDic);
                

                
            }

            [_mytableView reloadData];
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
    }];



}

#pragma mark - UITableViewDelegate
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return _dataArr.count;
//}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (0 == indexPath.row)
    {
        newCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (cell == nil)
        {
            cell = [[newCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        NewsModel *model = [_dataArr objectAtIndex:indexPath.row];
        
        cell.fromeLable.text=model.a_Title;
        
        cell.newlabel.text=model.a_From;
        cell.dataTimew.text=model.a_AddDate;
       // [cell.iamge setImageWithURL:[NSURL URLWithString:model.a_SmallImg] ];
       
        
        [cell.iamgeView setImageWithURL:[NSURL URLWithString:model.a_SmallImg]];
      //  NSLog(@"model.a_SmallImg------%@",model.a_SmallImg);
       
                // }
    return cell;
    }

    else{
      
        NewsTableViewCell *cell1=[tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
          //  cell1 = [[NewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NewsCell"];
    
//        for (int i=1;i<_dataArr.count;i++)
//        {
        
            NewsModel *model = [_dataArr objectAtIndex:indexPath.row];
            
            cell1.newlab.text=model.a_Title;
            
            cell1.fromLab.text=model.a_From;
            cell1.dataTimelab.text=model.a_AddDate;
            
            [cell1.iamge setImageWithURL:[NSURL URLWithString:model.a_SmallImg] ];
            
           
    
        return cell1;
   // }
   

    return nil;
}
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.row ) {
        return 165;
    }else
    {
        return 100;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailsViewController *ctl2=[[DetailsViewController alloc]init];
//    NSDictionary *dic=_dataArr[indexPath.row];
//    ctl2.goodIndex=[dic [@""]integerValue];
    [self.navigationController pushViewController:ctl2 animated:YES];
}


@end
