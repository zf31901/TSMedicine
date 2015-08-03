//
//  WIBaseImageView.m
//  nRF_Proximity
//
//  Created by licy on 14-7-11.
//  Copyright (c) 2014年 licy. All rights reserved.
//

#import "WIBaseImageView.h"

@implementation WIBaseImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(WIBaseImageView *)createClassWithFrame:(CGRect)frame andWithImg:(NSString *)img andWithTag:(NSInteger)tag andWithEnable:(BOOL)enable {
    UIImage *mImg = [UIImage imageNamed:img];
    WIBaseImageView *mImageView = [[WIBaseImageView alloc] initWithFrame:frame];
    mImageView.backgroundColor = [UIColor clearColor];
    mImageView.tag = tag;
    mImageView.image = mImg;
    mImageView.userInteractionEnabled = enable;
    
    return mImageView;
}

+ (WIBaseImageView *)createClassNetWorkWithFrame:(CGRect)frame andWithUrlImg:(NSString *)img andPlaceholderImage:(NSString *)placeholderImage andWithTag:(NSInteger)tag andWithEnable:(BOOL)enable {
    
    WIBaseImageView *mImageView = [[WIBaseImageView alloc] initWithFrame:frame];
    mImageView.tag = tag;
    mImageView.userInteractionEnabled = enable;
    
//    [mImageView setImageWithURL:[NSURL URLWithString:img] placeholderImage:[UIImage imageNamed:yuer_news_loading_png]];
    [mImageView sd_setImageWithURL:[NSURL URLWithString:img] placeholderImage:[UIImage imageNamed:placeholderImage] options:SDWebImageRefreshCached];
    
    return mImageView;
}

+ (WIBaseImageView *)createWithFrame:(CGRect)frame img:(NSString *)img tag:(NSInteger)tag enable:(BOOL)enable {
    UIImage *mImg = [UIImage imageNamed:img];
    WIBaseImageView *mImageView = [[WIBaseImageView alloc] initWithFrame:frame];
    mImageView.backgroundColor = [UIColor clearColor];
    mImageView.tag = tag;
    mImageView.image = mImg;
    mImageView.userInteractionEnabled = enable;
    
    return mImageView;
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
