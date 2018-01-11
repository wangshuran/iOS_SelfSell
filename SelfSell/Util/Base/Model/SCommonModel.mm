//
//  SCommonModel.m
//  SelfSell
//
//  Created by liqiang on 2018/1/11.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SCommonModel.h"
#import "SCommonModel+WCTTableCoding.h"

@implementation SCommonModel

#pragma mark - 绑定表对应的类

WCDB_IMPLEMENTATION(SCommonModel)


#pragma mark - 主键

WCDB_PRIMARY(SCommonModel, uid)


#pragma mark - 索引

WCDB_INDEX(SCommonModel, "_index", createTime)


#pragma mark - 绑定表和字段

WCDB_SYNTHESIZE(SCommonModel, createTime)
WCDB_SYNTHESIZE(SCommonModel, displayOrder)
WCDB_SYNTHESIZE(SCommonModel, version)
WCDB_SYNTHESIZE(SCommonModel, key)
WCDB_SYNTHESIZE(SCommonModel, value)
WCDB_SYNTHESIZE(SCommonModel, data)

@end
