//
//  SDao.h
//  SelfSell
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SObject.h"

@interface SDao : SObject

//打开数据库
+ (instancetype)dbPath:(NSString *)dbPath secret:(NSString *)secret;

//打开数据库
- (BOOL)openWithDBPath:(NSString *)dbPath secret:(NSString *)secret;

//关闭连接
- (void)close;

//获取实例
- (id)client;

//创建表
- (BOOL)createTable:(SModel *)model;

//删除表
- (BOOL)dropTable:(SModel *)model;

//插入对象
- (BOOL)insertObject:(SModel *)model;

//批量插入对象
- (BOOL)insertObjects:(NSArray<SModel *> *)models;

//删除全部对象
- (BOOL)deleteAllObjectsFromTable:(SModel *)model;

//获取全部对象
- (NSArray<SModel *> *)getAllObjectsFromTable:(SModel *)model;

//更新对象
- (BOOL)updateObject:(SModel *)model;

@end
