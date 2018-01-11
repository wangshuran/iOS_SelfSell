//
//  SDao+Category.h
//  SelfSell
//
//  Created by liqiang on 2018/1/11.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SDao.h"
#import <WCDB/WCDB.h>

@interface SDao(Category)

//按条件删除对象
- (BOOL)deleteObjectsFromTable:(SModel *)model condition:(const WCTCondition &)condition;

//按条件获取全部对象
- (NSArray<SModel *> *)getObjectsFromTable:(SModel *)model condition:(const WCTCondition &)condition;

//按顺序获取全部对象
- (NSArray<SModel *> *)getObjectsFromTable:(SModel *)model orderList:(const WCTOrderByList &)orderList;

//按条件、顺序获取全部对象
- (NSArray<SModel *> *)getObjectsFromTable:(SModel *)model condition:(const WCTCondition &)condition orderList:(const WCTOrderByList &)orderList;

//按条件获取一个对象
- (SModel *)getObjectFromTable:(SModel *)model condition:(const WCTCondition &)condition;

//按顺序获取一个对象
- (SModel *)getObjectFromTable:(SModel *)model orderList:(const WCTOrderByList &)orderList;

//按条件、顺序获取一个对象
- (SModel *)getObjectFromTable:(SModel *)model condition:(const WCTCondition &)condition orderList:(const WCTOrderByList &)orderList;

//更新对象
- (BOOL)updateObject:(SModel *)model property:(const WCTProperty &)property;

@end
