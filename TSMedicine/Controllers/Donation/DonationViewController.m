//
//  DonationViewController.m
//  TSMedicine
//
//  Created by lyy on 15-6-8.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "DonationViewController.h"
#import "AskForDonationViewController.h"
@interface DonationViewController ()
@property (weak, nonatomic) IBOutlet X_TableView *tableView;

@end

@implementation DonationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"捐助项目";
    
    //NSArray *titleArr = @[@"性别",@"年龄",@"手机号",@"地址",@"街道"];
    NSMutableArray *arr=[[NSMutableArray alloc]init];
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
                DetailModel *model=[[DetailModel alloc]init];
                NSDictionary *dataDic = (NSDictionary *)[dataArr objectAtIndex:i];
                
                
                model.pname=[dataDic objectForKey:@"pname"];
                model.pjieshao=[dataDic objectForKey:@"pjieshao"];
                model.pfaqidanwei=[dataDic objectForKey:@"pfaqidanwei"];
                model.pimage=[dataDic  objectForKey:@"pimage"];
                
                [testArr addObject:model];
                NSLog(@"dic12345----%@",dataDic);
                
                [arr addObject:[@{
                                  kCellTag:@"DonationCell",
                                  kCellDidSelect:@"DonationCell",
                                  @"donation_titleLab":[dataDic objectForKey:@"pname"],
                                  @"donation_contentlab":[dataDic objectForKey:@"pjieshao"],
                                  @"donation_unitlab":[dataDic objectForKey:@"pfaqidanwei"],
                                  @"donation_imgView":[dataDic  objectForKey:@"pimage"],
                                  } mutableCopy]];
                //            [arr addObject:[@{
                //                              kCellTag:@"ThinLine",
                //                              kCellDidSelect:@"f1",
                //                              @"l":@"12",
                //                              } mutableCopy]];
                
            }
            self.tableView.xDataSource = arr;
            
            [self.tableView reloadData];
            
        }
        [self lable];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
    }];
    
    
    //    AFHTTPRequestOperationManager*manger=[AFHTTPRequestOperationManager manager];
    //    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    //    [manger GET:URLLIST parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    //      NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
    //
    //        DetailModel*model=[[DetailModel alloc]init];
    //        
    //        [model setValuesForKeysWithDictionary:dic];
    //        
    //        [arr addObject:model];
    //        NSLog(@"=========%@",arr);
    //        
    //    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //        
    //    }];
    //
}

-(void)lable{
    
    WEAKSELF
    [self.tableView addCellEventListenerWithName:@"DonationCell" block:^(X_TableViewCell *cell) {
        
        NSIndexPath *indexPath = [weakSelf.tableView indexPathForCell:cell];
        NSLog(@"-----cell-->>\n%ld",(long)indexPath.row);
        
        AskForDonationViewController *askVC = [AskForDonationViewController new];
        askVC.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:askVC animated:YES];
    }];
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
