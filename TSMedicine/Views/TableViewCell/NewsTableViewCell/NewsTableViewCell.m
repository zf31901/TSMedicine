//
//  ShopCell.m
//  customCellByCode
//
//  Created by Imanol on 11/10/14.
//  Copyright (c) 2014 ImanolZhang. All rights reserved.
//
#import "UIImageView+AFNetworking.h"

#define kCellBorder 20
#define kCellCenterX self.frame.size.width/2
#define kNameFont [UIFont systemFontOfSize:16]
#define kDescriptionFont [UIFont systemFontOfSize:14]
#define kImageWH 70
    
#import "NewsTableViewCell.h"
#import "ShopFrame.h"
#import "Shop.h"


@interface NewsTableViewCell (){
        UILabel * _name;
        UILabel * _description;
        UIImageView *_imageView;
        UILabel *_fromLable;
        UILabel *_time;
        
    }
    
    
@end
    
@implementation NewsTableViewCell
    
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
    {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
            
            
            //add compoment to contentView
            _name = [[UILabel alloc]init];
            _name.font = kNameFont;
            _name.textAlignment = NSTextAlignmentCenter;
            [self.contentView addSubview:_name];
            
            _description = [[UILabel alloc]init];
            _description.font = kDescriptionFont;
            _description.numberOfLines = 0;
            [self.contentView addSubview:_description];
            
            _imageView = [[UIImageView alloc]init];
            [self.contentView addSubview:_imageView];
            
            _fromLable=[[UILabel alloc]init];
            _fromLable.font=kDescriptionFont;
            _fromLable.numberOfLines=0;
            [self.contentView addSubview:_fromLable];
            
            
            _time=[[UILabel alloc]init];
            _time.font=kNameFont;
            _time.numberOfLines=0;
            [self.contentView addSubview:_time];
            
            
            
            
        }
        return self;
    }
    
- (void)awakeFromNib
    {
        // Initialization code
    }
    
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
    {
        [super setSelected:selected animated:animated];
        
        // Configure the view for the selected state
    }
    
    
-(void)settingData{
        
        Shop *shop = _shopFrame.shop;
        
        _name.text = shop.name;
        NSLog(@"12121212%@",_name.text);
        _description.text = shop.dcription;
        
        _imageView.image = [UIImage imageNamed:shop.image];
        
        _fromLable.text=shop.fromLable;
        
        _time.text=shop.time;
        
        
        
        
    }
    
    
-(void)settingFrame{
        
        CGFloat nameY = kCellBorder;
        
        _name.frame = _shopFrame.nameF;
        _name.center = CGPointMake(self.center.x, nameY);
        
        _description.frame = _shopFrame.descriptionF;
        
        _imageView.frame =_shopFrame.imageViewF;
        
        _fromLable.frame=_shopFrame.fromLable;
        _time.frame=_shopFrame.time;
        
        
    }
    
-(void)setShopFrame:(ShopFrame *)shopFrame{
        
        _shopFrame = shopFrame;
        
        [self settingData];
        
        [self settingFrame];
        
    }
    
    @end





