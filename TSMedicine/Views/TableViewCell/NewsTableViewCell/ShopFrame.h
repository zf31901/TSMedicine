//
//  ShopFrame.h
//  customCellByCode
//
//  Created by Imanol on 11/10/14.
//  Copyright (c) 2014 ImanolZhang. All rights reserved.
//caculate every compoment's frame

#import <Foundation/Foundation.h>
@class Shop;

@interface ShopFrame : NSObject

@property(nonatomic, assign ,readonly)  CGRect nameF;
@property(nonatomic, assign ,readonly)  CGRect descriptionF;
@property(nonatomic, assign ,readonly)  CGRect imageViewF;
@property(nonatomic,assign,readonly)CGRect  fromLable;
@property(nonatomic,assign,readonly)CGRect  time;




@property(nonatomic, assign )  CGFloat cellHeight;
@property(nonatomic, strong) Shop *shop;

@end
