//
//  MyApplication.m
//  TSMedicine
//
//  Created by 123 on 15/8/4.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "MyApplication.h"
#import "MyAppCellTableViewCell.h"
#import "MyAppModel.h"

#import "UIImageView+AFNetworking.h"


#define URL @"http://app.aixinland.cn/api/userproject/List"


@interface MyApplication ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_mytableView;
    NSMutableArray *_dataArr;
    

}
@end

@implementation MyApplication

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的申请";
   
    
     NSMutableArray *testArr = [NSMutableArray array];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
    [dic setObject:@"1"              forKey:@"pageid"];
    [dic setObject:@"3"      forKey:@"pagesize"];
    YYHttpRequest *hq=[YYHttpRequest shareInstance];
    
    [hq GETURLString:URL parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObj) {
        
        
        NSLog(@"111111111%@",responseObj);
        
        if ([responseObj objectForKey:@"data"] !=nil) {
            NSArray *dataArr =[responseObj objectForKey:@"data"];
            
            NSLog(@"222222%lu",(unsigned long)dataArr.count);
            for (int i = 0; i < dataArr.count; i++)
            {
                MyAppModel *model=[[MyAppModel alloc]init];
                NSDictionary *dataDic = (NSDictionary *)[dataArr objectAtIndex:i];
                
                
                model.upname1=[dataDic objectForKey:@"upname"];
                model.upcreatedate1=[dataDic objectForKey:@"upcreatedate"];
                
                model.upimage1=[dataDic  objectForKey:@"upimage"];
                
                [testArr addObject:model];
                NSLog(@"dic12345----%@",dataDic);

            
            }
            
        }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            
        }];
        

}
#pragma mark - UITableViewDelegate
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyAppCellTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==0) {
    
        cell=[[MyAppCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    MyAppModel *model=[_dataArr objectAtIndex:indexPath.row];
    cell.upname.text=model.upname1;
    cell.dataTime.text=model.upcreatedate1;
    [cell.upimage setImageWithURL:[NSURL URLWithString:model.upimage1] ];

    
    
    return nil;
    
    
}



@end
