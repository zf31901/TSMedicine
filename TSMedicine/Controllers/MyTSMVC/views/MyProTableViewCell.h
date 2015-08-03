//
//  MyProTableViewCell.h
//  TSMedicine
//
//  Created by lyy on 15-8-3.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProModel.h"

@interface MyProTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIButton *questionBtn;

@property (nonatomic,strong) MyProModel *model;

@end
