//
//  MyHeaderView.m
//  TSMedicine
//
//  Created by lyy on 15-8-3.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "MyHeaderView.h"

@implementation MyHeaderView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = CommonBgColor;
        
        [self initUI];
    }
    return self;
}

-(void)initUI
{
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
    _bgView.backgroundColor = [UIColor clearColor];
    _bgView.layer.cornerRadius = _bgView.size.width/2;
    _bgView.layer.borderWidth = 6.0f;
    _bgView.layer.borderColor = RGBA(255, 255, 255, 0.2).CGColor;
    CGPoint center = self.center;
    _bgView.center = CGPointMake(center.x, center.y - 8);
    [self addSubview:_bgView];
    
    _headImageView = [WIBaseImageView createClassNetWorkWithFrame:CGRectMake(0, 0, 60, 60) andWithUrlImg:nil andPlaceholderImage:@"默认头像80" andWithTag:0 andWithEnable:YES];
    _headImageView.center = CGPointMake(center.x, center.y - 8);
    [_headImageView makeCorner:_headImageView.size.width/2];
    [self addSubview:_headImageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myTap)];
    [_headImageView addGestureRecognizer:tap];
    
    _nameLab = [WIBaseLabel createClassWithTitle:@"点击登录" andWithFrame:CGRectMake(0, 0, 150, 20) andWithFont:16];
    _nameLab.center = CGPointMake(center.x, center.y + 45);
    _nameLab.backgroundColor = [UIColor clearColor];
    _nameLab.textAlignment = NSTextAlignmentCenter;
    _nameLab.textColor = RGB(255, 255, 255);
    [self addSubview:_nameLab];
    
    
}

-(void)myTap
{
    if ([_delegate respondsToSelector:@selector(myHeaderViewClick:)]) {
        [_delegate myHeaderViewClick:self];
    }
}

@end
