//
//  MyHeaderView.h
//  TSMedicine
//
//  Created by lyy on 15-8-3.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyHeaderView;

@protocol MyHeaderViewDelegate <NSObject>

@optional
-(void)myHeaderViewClick:(MyHeaderView *)headerView;

@end

@interface MyHeaderView : UIView

@property (strong,nonatomic) UIView *bgView;
@property (strong,nonatomic) WIBaseImageView *headImageView;
@property (strong,nonatomic) WIBaseLabel *nameLab;

@property (weak,nonatomic) id <MyHeaderViewDelegate> delegate;

@end
