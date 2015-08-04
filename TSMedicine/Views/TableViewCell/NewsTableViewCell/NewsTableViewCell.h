//
//  NewsTableViewCell.h
//  TSMedicine
//
//  Created by lyy on 15-7-7.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShopFrame;

@interface NewsTableViewCell :UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *dataTimelab;

@property (weak, nonatomic) IBOutlet UILabel *fromLab;

@property (weak, nonatomic) IBOutlet UILabel *newlab;


@property (weak, nonatomic) IBOutlet UIImageView *iamge;

@property(nonatomic, strong) ShopFrame *shopFrame;
@end
