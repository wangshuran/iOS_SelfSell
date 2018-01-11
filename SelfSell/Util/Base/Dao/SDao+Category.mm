//
//  SDao+Category.m
//  SelfSell
//
//  Created by liqiang on 2018/1/11.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SDao+Category.h"
#import "SModel+WCTTableCoding.h"

@implementation SDao(Category)

#pragma mark - Interface

- (BOOL)deleteObjectsFromTable:(SModel *)model condition:(const WCTCondition &)condition {
    if (!model) {
        return NO;
    }
    
    @try {
        return [[self db] deleteObjectsFromTable:NSStringFromClass(model.class) where:condition];
    }@catch(NSException * e) {
        return NO;
    }
}

- (NSArray<SModel *> *)getObjectsFromTable:(SModel *)model condition:(const WCTCondition &)condition {
    if (!model) {
        return nil;
    }
    
    @try {
        return [[self db] getObjectsOfClass:model.class fromTable:NSStringFromClass(model.class) where:condition];
    }@catch(NSException * e) {
        return nil;
    }
}

- (NSArray<SModel *> *)getObjectsFromTable:(SModel *)model orderList:(const WCTOrderByList &)orderList {
    if (!model) {
        return nil;
    }
    
    @try {
        return [[self db] getObjectsOfClass:model.class fromTable:NSStringFromClass(model.class) orderBy:orderList];
    }@catch(NSException * e) {
        return nil;
    }
}

- (NSArray<SModel *> *)getObjectsFromTable:(SModel *)model condition:(const WCTCondition &)condition orderList:(const WCTOrderByList &)orderList {
    if (!model) {
        return nil;
    }
    
    @try {
        return [[self db] getObjectsOfClass:model.class fromTable:NSStringFromClass(model.class) where:condition orderBy:orderList];
    }@catch(NSException * e) {
        return nil;
    }
}

- (SModel *)getObjectFromTable:(SModel *)model condition:(const WCTCondition &)condition {
    if (!model) {
        return nil;
    }
    
    @try {
        return [[self db] getOneObjectOfClass:model.class fromTable:NSStringFromClass(model.class) where:condition];
    }@catch(NSException * e) {
        return nil;
    }
}

- (SModel *)getObjectFromTable:(SModel *)model orderList:(const WCTOrderByList &)orderList {
    if (!model) {
        return nil;
    }
    
    @try {
        return [[self db] getOneObjectOfClass:model.class fromTable:NSStringFromClass(model.class) orderBy:orderList];
    }@catch(NSException * e) {
        return nil;
    }
}

- (SModel *)getObjectFromTable:(SModel *)model condition:(const WCTCondition &)condition orderList:(const WCTOrderByList &)orderList {
    if (!model) {
        return nil;
    }
    
    @try {
        return [[self db] getOneObjectOfClass:model.class fromTable:NSStringFromClass(model.class) where:condition orderBy:orderList];
    }@catch(NSException * e) {
        return nil;
    }
}

- (BOOL)updateObject:(SModel *)model property:(const WCTProperty &)property {
    if (!model) {
        return NO;
    }
    
    @try {
        return [[self db] updateAllRowsInTable:NSStringFromClass(model.class) onProperty:property withObject:model];
    }@catch(NSException * e) {
        return NO;
    }
}

#pragma mark - Private

- (WCTDatabase *)db {
    return (WCTDatabase *)[self client];
}


@end
