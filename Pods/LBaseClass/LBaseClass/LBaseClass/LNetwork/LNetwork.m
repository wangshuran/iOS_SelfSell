//
//  LNetwork.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LNetwork.h"
#import <AFNetworking/AFNetworking.h>

@implementation LNetwork

+ (void)request:(LRequest *)request block:(LRequestBlock)block {
    if (!request) {
        if (block) {
            LResponse * response = [[LResponse alloc] init];
            response.status = NO;
            
            block(request, response);
        }
    }
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = request.timeoutInterval;
    
    if (request.method == HttpMethodGet) {
        [manager GET:request.url parameters:request.getParameter progress:^(NSProgress * downloadProgress) {
            
        } success:^(NSURLSessionDataTask * task, id responseObject) {
            if (block) {
                LResponse * response = [[request.responseClass alloc] init];
                [response reflect:responseObject];
                response.status = YES;
                
                block(request, response);
            }
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            if (block) {
                LResponse * response = [[request.responseClass alloc] init];
                response.status = NO;
                response.msg = error.localizedDescription;
                
                block(request, response);
            }
        }];
    }else {
        [manager POST:request.url parameters:request.getParameter progress:^(NSProgress * uploadProgress) {
            
        } success:^(NSURLSessionDataTask * task, id responseObject) {
            if (block) {
                LResponse * response = [[request.responseClass alloc] init];
                [response reflect:responseObject];
                response.status = YES;
                
                block(request, response);
            }
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            if (block) {
                LResponse * response = [[request.responseClass alloc] init];
                response.status = NO;
                response.msg = error.localizedDescription;
                
                block(request, response);
            }
        }];
    }
}

@end
