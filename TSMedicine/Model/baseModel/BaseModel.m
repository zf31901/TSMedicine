//
//  BaseModel.m
//  Shop
//
//  Created by Harry on 13-12-20.
//  Copyright (c) 2013年 Harry. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+ (instancetype)shareInstance
{
    return [[self alloc] init];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    return [super init];
}

@end
