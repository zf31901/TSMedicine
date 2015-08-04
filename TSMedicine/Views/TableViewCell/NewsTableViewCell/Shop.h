//
//  Shop.h
//  customCellByCode
//
//  Created by Imanol on 11/10/14.
//  Copyright (c) 2014 ImanolZhang. All rights reserved.
//do nothing but pass data

#import <Foundation/Foundation.h>

@interface Shop : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *dcription;
@property (nonatomic, copy) NSString *image;
@property(nonatomic,copy)NSString  *fromLable;
@property(nonatomic,copy)NSString *time;


-(id)initWithDict:(NSDictionary *) dict;
+(id)shopWithDict:(NSDictionary *) dict;
//获取今天的日期：年月日
+(NSDictionary *)getTodayDate;


@end
