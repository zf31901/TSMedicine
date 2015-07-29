//
//  YYHttpRequest.h
//  TSMedicine
//
//  Created by lyy on 15-7-7.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import "AFNetworkReachabilityManager.h"

#define HttpRequest [YYHttpRequest shareInstance]

#define DefineTimeout           20.0

#define OfficialEnvironment
#ifdef OfficialEnvironment
#define BaseDemain          @"http://myapi.aixinland.cn"
#define MemberBaseDemain    @"http://myapi.aixinland.cn"
#define ApiKey              @"900000001"
#define UUPAY_CODE          @"00"       //正式环境

#else
#define BaseDemain          @"http://app.aixinland.cn"
#define MemberBaseDemain    @"http://app.aixinland.cn"
#define ApiKey              @"100000002"
#define UUPAY_CODE          @"01"       //开发环境
#endif


@interface YYHttpRequest : AFHTTPRequestOperationManager
+ (instancetype)shareInstance;
+ (instancetype)shareInstance_myapi;

//内存缓存：默认为4M，可以提高url加载速度，但是当内存过大时，会提高运行速度
+ (NSUInteger)getCacheData;
+ (void)clearAllCacheData;

//文件缓存：对图片进行缓存，使用egoCache进行缓存
+ (NSString *)getFileCachePath;
+ (NSUInteger)getFileCacheData;

// GET： timeout默认为10秒 ,默认有缓存
- (void)GETURLString:(NSString *)URLString
          parameters:(NSDictionary *)parameters
             success:(void (^)(AFHTTPRequestOperation *operation,id responseObj))success
             failure:(void (^)(AFHTTPRequestOperation *operation,NSError *error))failure;

// GET： timeout自定义设置，也可以在方法实现中设置request（比如缓存策略）,默认有缓存
- (void)GETURLString:(NSString *)URLString
         withTimeOut:(CGFloat )timeout
          parameters:(NSDictionary *)parameters
             success:(void (^)(AFHTTPRequestOperation *operation,id responseObj))success
             failure:(void (^)(AFHTTPRequestOperation *operation,NSError *error))failure;

// GET： timeout自定义设置，也可以在方法实现中设置request（比如缓存策略）,默认无缓存
- (void)GETURLString:(NSString *)URLString
           userCache:(BOOL)isCache
          parameters:(NSDictionary *)parameters
             success:(void (^)(AFHTTPRequestOperation *operation,id responseObj))success
             failure:(void (^)(AFHTTPRequestOperation *operation,NSError *error))failure;


//POST
- (void)POSTURLString:(NSString *)URLString
           parameters:(NSDictionary *)parameters
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)POSTURLString:(NSString *)URLString
          withTimeout:(CGFloat )timeout
           parameters:(NSDictionary *)parameters
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)POSTURLString:(NSString *)URLString
           parameters:(NSDictionary *)parameters
            imageData:(NSData *)data
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;



//PUT
- (void )PUTURLString:(NSString *)URLString
           parameters:(NSDictionary *)parameters
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void )PUTURLString:(NSString *)URLString
          withTimeout:(CGFloat )timeout
           parameters:(NSDictionary *)parameters
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;



//DELETE
- (void )DELETEURLString:(NSString *)URLString
              parameters:(NSDictionary *)parameters
                 success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                 failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void )DELETEURLString:(NSString *)URLString
             withTimeout:(CGFloat )timeout
              parameters:(NSDictionary *)parameters
                 success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                 failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
@end
