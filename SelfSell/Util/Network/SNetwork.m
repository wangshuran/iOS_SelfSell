//
//  SNetwork.m
//  SelfSell
//
//  Created by liqiang on 2017/12/26.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SNetwork.h"

@implementation SNetwork

#pragma mark - Interface

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
    manager.requestSerializer.timeoutInterval = request.timeoutInterval;
    if (![NSString isNullOrEmpty:[AppContext sharedAppContext].accountModel.token]) {
        [manager.requestSerializer setValue:[AppContext sharedAppContext].accountModel.token forHTTPHeaderField:@"Authorization"];
    }
    [manager.requestSerializer setValue:@"Lang" forHTTPHeaderField:@"Lang"];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

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
