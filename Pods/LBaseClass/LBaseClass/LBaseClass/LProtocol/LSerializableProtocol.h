//
//  LSerializable Protocol.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/21.
//  Copyright © 2017年 liqiang. All rights reserved.
//

@protocol LSerializableProtocol <NSObject>

@optional

/**
 获取JSON
 */
- (NSString *)getJSON;//未实现

/**
 获取XML
 */
- (NSString *)getXML;//未实现

/**
 查询请求参数
 */
- (NSString *)getQuery;

/**
 查询请求参数
 */
- (NSMutableDictionary *)getParameter;

@end
