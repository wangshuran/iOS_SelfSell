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
    if ([AppContext sharedAppContext].loginType != LoginTypeNone && ![NSString isNullOrEmpty:[AppContext sharedAppContext].accountModel.token]) {
        [manager.requestSerializer setValue:[AppContext sharedAppContext].accountModel.token forHTTPHeaderField:@"Authorization"];
    }
    if ([AppContext sharedAppContext].language == LanguageEN) {
        [manager.requestSerializer setValue:@"en_US" forHTTPHeaderField:@"Lang"];
    }else if ([AppContext sharedAppContext].language == LanguageSC) {
        [manager.requestSerializer setValue:@"zh_CN" forHTTPHeaderField:@"Lang"];
    }
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    if (request.method == HttpMethodGet) {
        [manager GET:request.url parameters:request.getParameter progress:^(NSProgress * downloadProgress) {
            
        } success:^(NSURLSessionDataTask * task, id responseObject) {
            if (block) {
                NSNumber * success = responseObject[@"success"];
                LResponse * response = nil;
                if (success.boolValue) {
                    NSDictionary * data = responseObject[@"data"];
                    response = data ? [request.responseClass mj_objectWithKeyValues:data] : [[request.responseClass alloc] init];
                    response.status = YES;
                }else {
                    id message = responseObject[@"message"];
                    response = [[request.responseClass alloc] init];
                    response.status = YES;
                    response.msg = [NSString stringWithFormat:@"%@", [NSString isNullOrEmpty:message] ? @"" : message];
                }
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
                NSNumber * success = responseObject[@"success"];
                LResponse * response = nil;
                if (success.boolValue) {
                    NSDictionary * data = responseObject[@"data"];
                    response = data ? [request.responseClass mj_objectWithKeyValues:data] : [[request.responseClass alloc] init];
                    response.status = YES;
                }else {
                    id message = responseObject[@"message"];
                    response = [[request.responseClass alloc] init];
                    response.status = NO;
                    response.msg = [NSString stringWithFormat:@"%@", [NSString isNullOrEmpty:message] ? @"" : message];
                }
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
