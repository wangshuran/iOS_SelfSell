//
//  SModel.m
//  SelfSell
//
//  Created by liqiang on 2017/12/18.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SModel.h"
#import "SModel+WCTTableCoding.h"

@implementation SModel

#pragma mark - 绑定表对应的类

WCDB_IMPLEMENTATION(SModel)


#pragma mark - 主键

WCDB_PRIMARY(SModel, uid)


#pragma mark - 索引

WCDB_INDEX(SModel, "_index", createTime)


#pragma mark - 绑定表和字段

WCDB_SYNTHESIZE(SModel, createTime)
WCDB_SYNTHESIZE(SModel, displayOrder)
WCDB_SYNTHESIZE(SModel, version)

@end
