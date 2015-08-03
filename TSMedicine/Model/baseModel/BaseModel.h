//
//  BaseModel.h
//  Shop
//
//  Created by Harry on 13-12-20.
//  Copyright (c) 2013年 Harry. All rights reserved.
//

/********************************************************
 *  1.所有自定义对象的基类；
 *
 *  2.调用［shareInstance］快速生成对象；
 *
 *  3.保存在NSUserDefault中需要在子类实现NSCodeing协议；
 *********************************************************/

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject <NSCoding>

+ (instancetype)shareInstance;

@end
