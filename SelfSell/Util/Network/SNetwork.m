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
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (!request) {
            if (block) {
                LResponse * response = [[LResponse alloc] init];
                response.status = NO;
                dispatch_async(dispatch_get_main_queue(), ^{
                    block(request, response);
                });
            }
            return;
        }
        
        AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = request.timeoutInterval;
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        if ([[AppContext sharedAppContext].accountModel isLoginUser]) {
            [manager.requestSerializer setValue:[AppContext sharedAppContext].accountModel.token forHTTPHeaderField:@"Authorization"];
        }
        if ([AppContext sharedAppContext].accountModel.language == LanguageEN) {
            [manager.requestSerializer setValue:@"en_US" forHTTPHeaderField:@"Lang"];
        }else if ([AppContext sharedAppContext].accountModel.language == LanguageSC) {
            [manager.requestSerializer setValue:@"zh_CN" forHTTPHeaderField:@"Lang"];
        }
        if (request.method == HttpMethodGet) {
            [manager GET:request.url parameters:request.getParameter progress:^(NSProgress * downloadProgress) {
                
            } success:^(NSURLSessionDataTask * task, id responseObject) {
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    if (block) {
                        LResponse * response = [[request.responseClass alloc] init];
                        [response reflect:responseObject];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            block(request, response);
                        });
                    }
                });
            } failure:^(NSURLSessionDataTask * task, NSError * error) {
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    if (block) {
                        LResponse * response = [[request.responseClass alloc] init];
                        [response reflect:[NSDictionary dictionaryWithObjectsAndKeys:@"0", @"success", error.localizedDescription, @"message", nil]];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            block(request, response);
                        });
                    }
                });
            }];
        }else {
            [manager POST:request.url parameters:request.getParameter progress:^(NSProgress * uploadProgress) {
                
            } success:^(NSURLSessionDataTask * task, id responseObject) {
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    if (block) {
                        LResponse * response = [[request.responseClass alloc] init];
                        [response reflect:responseObject];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            block(request, response);
                        });
                    }
                });
            } failure:^(NSURLSessionDataTask * task, NSError * error) {
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    if (block) {
                        LResponse * response = [[request.responseClass alloc] init];
                        [response reflect:[NSDictionary dictionaryWithObjectsAndKeys:@"0", @"success", error.localizedDescription, @"message", nil]];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            block(request, response);
                        });
                    }
                });
            }];
        }
    });
}

@end
