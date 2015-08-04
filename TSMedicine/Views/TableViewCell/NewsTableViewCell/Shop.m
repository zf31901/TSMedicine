//
//  Shop.m
//  customCellByCode
//
//  Created by Imanol on 11/10/14.
//  Copyright (c) 2014 ImanolZhang. All rights reserved.
//

#import "Shop.h"

@implementation Shop

-(id)initWithDict:(NSDictionary *)dict{

//    _name = dict[@"name"];
//    _dcription = dict[@"desc"];
//    _image = dict[@"icon"];
    
    _name=[dict objectForKey:@"name"];
    _dcription=[dict objectForKey:@"dcription"];
    _image=[dict objectForKey:@"image"];
    _fromLable=[dict objectForKey:@"fromLable"];
    _time=[dict objectForKey:@"time"];

    
    return self;
}

+(id)shopWithDict:(NSDictionary *)dict{

    return [[self alloc]initWithDict:dict];
}

#pragma  mark - 获取当天的日期：年月日
+ (NSDictionary *)getTodayDate
{
    
    //获取今天的日期
    NSDate *today = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = kCFCalendarUnitYear|kCFCalendarUnitMonth|kCFCalendarUnitDay;
    
    NSDateComponents *components = [calendar components:unit fromDate:today];
    NSString *year = [NSString stringWithFormat:@"%d", [components year]];
    NSString *month = [NSString stringWithFormat:@"%02d", [components month]];
    NSString *day = [NSString stringWithFormat:@"%02d", [components day]];
    
    NSMutableDictionary *todayDic = [[NSMutableDictionary alloc] init];
    [todayDic setObject:year forKey:@"year"];
    [todayDic setObject:month forKey:@"month"];
    [todayDic setObject:day forKey:@"day"];
    
    return todayDic;
    
}

@end
