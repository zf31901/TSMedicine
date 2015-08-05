//
//  MyUserInfoView.m
//  TSMedicine
//
//  Created by lyy on 15-8-4.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "MyUserInfoView.h"

@implementation MyUserInfoView

-(void)awakeFromNib
{
    
    [_headImageView makeCorner:_headImageView.size.width/2];
    
    NSArray *arr = [NSArray arrayWithObjects:_bgView1, _bgView2, _bgView3, _bgView4, _bgView5, _bgView6,nil];
    for (int i = 0; i < arr.count; i++) {
        
        UIView *view = (UIView *)arr[i];
        view.tag = i + 100;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myTap:)];
        [view addGestureRecognizer:tap];
        
    }
    
}

-(void)myTap:(UIView *)sender
{
    
}

@end
