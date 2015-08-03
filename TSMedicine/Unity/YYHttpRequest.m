//
//  YYHttpRequest.m
//  TSMedicine
//
//  Created by lyy on 15-7-7.
//  Copyright (c) 2015年 ewt. All rights reserved.
//

#import "YYHttpRequest.h"
@implementation YYHttpRequest
+ (instancetype)shareInstance
{
    return [[self alloc] initWithBaseURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/",BaseDemain]]];
}

+ (instancetype)shareInstance_myapi
{
    return [[self alloc] initWithBaseURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/",MemberBaseDemain]]];
}



//GET
- (void)GETURLString:(NSString *)URLString
          parameters:(NSDictionary *)parameters
             success:(void (^)(AFHTTPRequestOperation *operation,id responseObj))success
             failure:(void (^)(AFHTTPRequestOperation *operation,NSError *error))failure
{
    [self GETURLString:URLString
           withTimeOut:DefineTimeout
            parameters:parameters
               success:success
               failure:failure];
}

- (void)GETURLString:(NSString *)URLString
         withTimeOut:(CGFloat )timeout
          parameters:(NSDictionary *)parameters
             success:(void (^)(AFHTTPRequestOperation *operation,id responseObj))success
             failure:(void (^)(AFHTTPRequestOperation *operation,NSError *error))failure
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    dic = [self appendRoutineParameterTo:dic];
    
//    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:nil];
    
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:dic error:nil];
    [request setTimeoutInterval:timeout];
    
//    request = [self setCacheMechanismWith:request];
    
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:success failure:failure];
    [self.operationQueue addOperation:operation];
    NSLog(@"GET === %@",request.URL);
}

- (void)GETURLString:(NSString *)URLString
           userCache:(BOOL)isCache
          parameters:(NSDictionary *)parameters
             success:(void (^)(AFHTTPRequestOperation *operation,id responseObj))success
             failure:(void (^)(AFHTTPRequestOperation *operation,NSError *error))failure
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    dic = [self appendRoutineParameterTo:dic];
    
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:dic];
    [request setTimeoutInterval:DefineTimeout];
    //使用缓存
//    if(isCache){
//        request = [self setCacheMechanismWith:request];
//    }
    
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:success failure:failure];
    [self.operationQueue addOperation:operation];
    
    NSLog(@"GET:%@",[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString]);
}

//POST
- (void)POSTURLString:(NSString *)URLString
           parameters:(NSDictionary *)parameters
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [self POSTURLString:URLString
            withTimeout:DefineTimeout
             parameters:parameters
                success:success
                failure:failure];
}

- (void)POSTURLString:(NSString *)URLString
          withTimeout:(CGFloat )timeout
           parameters:(NSDictionary *)parameters
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    dic = [self appendRoutineParameterTo:dic];
    
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"POST" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:dic];
    [request setTimeoutInterval:timeout];
    
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:success failure:failure];
    [self.operationQueue addOperation:operation];
    
    NSLog(@"POST ==== %@",[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString]);
//    NSLog(@"POST ==== %@",request.URL);
}

- (void)POSTURLString:(NSString *)URLString
           parameters:(NSDictionary *)parameters
            imageData:(NSData *)data
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    dic = [self appendRoutineParameterTo:dic];
    NSMutableURLRequest *request = [self.requestSerializer multipartFormRequestWithMethod:@"POST" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:data name:@"file" fileName:@"ebsIcon.png" mimeType:@"image/png"];
    }];
    
    [request setTimeoutInterval:60];
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:success failure:failure];
    [self.operationQueue addOperation:operation];
    
    NSLog(@"POST:%@",[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString]);
    
}

//PUT
- (void )PUTURLString:(NSString *)URLString
           parameters:(NSDictionary *)parameters
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [self PUTURLString:URLString
           withTimeout:DefineTimeout
            parameters:parameters
               success:success
               failure:failure];
}

- (void )PUTURLString:(NSString *)URLString
          withTimeout:(CGFloat )timeout
           parameters:(NSDictionary *)parameters
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    dic = [self appendRoutineParameterTo:dic];
    
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"PUT" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:dic];
    [request setTimeoutInterval:timeout];
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:success failure:failure];
    [self.operationQueue addOperation:operation];
    
    NSLog(@"PUT:%@",[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString]);
}

//DELETE
- (void )DELETEURLString:(NSString *)URLString
              parameters:(NSDictionary *)parameters
                 success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                 failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [self DELETEURLString:URLString
              withTimeout:DefineTimeout
               parameters:parameters
                  success:success
                  failure:failure];
}

- (void )DELETEURLString:(NSString *)URLString
             withTimeout:(CGFloat )timeout
              parameters:(NSDictionary *)parameters
                 success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                 failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    dic = [self appendRoutineParameterTo:dic];
    
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"DELETE" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:dic];
//    NSMutableURLRequest *requ = [self.requestSerializer requestWithMethod:@"DELETE" URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:dic error:nil];
    [request setTimeoutInterval:timeout];
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:success failure:failure];
    [self.operationQueue addOperation:operation];
    
    NSLog(@"DELETE:%@",[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString]);
}

- (NSMutableDictionary *)appendRoutineParameterTo:(NSMutableDictionary *)dic
{
    [dic setObject:ApiKey forKey:@"apikey"];
    
    return dic;
}
@end
