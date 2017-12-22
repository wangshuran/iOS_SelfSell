//
//  LRequest.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/21.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LModel.h"

typedef enum : NSUInteger {
    HttpMethodGet,//GET
    HttpMethodPost,//POST
} HttpMethod;


@interface LRequest : LModel

/**
 请求地址
 */
@property (nonatomic, copy) NSString * url;

/**
 请求方式
 */
@property (nonatomic, assign) HttpMethod method;

/**
 超时时长
 */
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

/**
 包ID
 */
@property (nonatomic, copy) NSString * bundleIdentifier;

/**
 版本号
 */
@property (nonatomic, copy) NSString * releaseVersion;

/**
 编译号
 */
@property (nonatomic, copy) NSString * buildVersion;

/**
 设备序列号
 */
@property (nonatomic, copy) NSString * deviceIdentifier;

@end
