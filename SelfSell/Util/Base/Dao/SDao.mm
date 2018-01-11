//
//  SDao.m
//  SelfSell
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SDao.h"
#import "SModel+WCTTableCoding.h"

@interface SDao(WCTTableCoding)<WCTTableCoding>

@end

@interface SDao()

@property (nonatomic, strong) WCTDatabase * wcdb;

@end

@implementation SDao

#pragma mark - Interface

+ (instancetype)dbPath:(NSString *)dbPath secret:(NSString *)secret{
    SDao * dao = [[SDao alloc] init];
    
    return [dao openWithDBPath:dbPath secret:secret] ? dao : nil;
}

- (BOOL)openWithDBPath:(NSString *)dbPath secret:(NSString *)secret{
    @try {
        self.wcdb = [[WCTDatabase alloc] initWithPath:dbPath];
        if ([NSString isNullOrEmpty:secret]) {
            [self.wcdb setCipherKey:[[LAppInfo CFBundleIdentifier] dataUsingEncoding:NSASCIIStringEncoding]];
        }else {
            [self.wcdb setCipherKey:[secret dataUsingEncoding:NSASCIIStringEncoding]];
        }
        
        return [self.wcdb canOpen] && [self.wcdb isOpened];
    }@catch(NSException * e) {
        return NO;
    }
}

- (void)close {
    @try {
        [self.wcdb close];
    }@catch(NSException * e) {
    }
}

- (id)client {
    return self.wcdb;
}

- (BOOL)createTable:(SModel *)model {
    if (!model) {
        return NO;
    }
    
    @try {
        return [self.wcdb createTableAndIndexesOfName:NSStringFromClass(model.class) withClass:model.class];
    }@catch(NSException * e) {
        return NO;
    }
}

- (BOOL)dropTable:(SModel *)model {
    if (!model) {
        return NO;
    }
    
    @try {
        return [self.wcdb dropTableOfName:NSStringFromClass(model.class)];
    }@catch(NSException * e) {
        return NO;
    }
}

- (BOOL)isTableExists:(SModel *)model {
    if (!model) {
        return NO;
    }
    
    @try {
        return [self.wcdb isTableExists:NSStringFromClass(model.class)];
    }@catch(NSException * e) {
        return NO;
    }
}

- (BOOL)insertObject:(SModel *)model {
    if (!model) {
        return NO;
    }
    
    @try {
        //NSMutableSet *keys = [model collectionPropertyKeys:YES];
        //for (NSString * key in keys) {
        //    id<NSFastEnumeration> values =[model valueForKey:key];
        //    if (values) {
        //        for (id value in values) {
        //            if ([value isKindOfClass:SModel.class]) {
        //                [self.wcdb insertObject:value into:NSStringFromClass(((SModel *)value).class)];
        //            }
        //        }
        //    }
        //}
        
        return [self.wcdb insertObject:model into:NSStringFromClass(model.class)];
    }@catch(NSException * e) {
        return NO;
    }
}

- (BOOL)insertObjects:(NSArray<SModel *> *)models {
    if (!models || models.count == 0) {
        return NO;
    }
    
    @try {
        //for (SModel * model in models) {
        //    NSMutableSet *keys = [model collectionPropertyKeys:YES];
        //    for (NSString * key in keys) {
        //        id<NSFastEnumeration> values =[model valueForKey:key];
        //        if (values) {
        //            for (id value in values) {
        //                if ([value isKindOfClass:SModel.class]) {
        //                    [self.wcdb insertObject:value into:NSStringFromClass(((SModel *)value).class)];
        //                }
        //            }
        //        }
        //    }
        //}
        
        return [self.wcdb insertObjects:models into:NSStringFromClass(models.firstObject.class)];
    }@catch(NSException * e) {
        return NO;
    }
}

- (BOOL)deleteAllObjectsFromTable:(SModel *)model {
    if (!model) {
        return NO;
    }
    [self.wcdb isTableExists:@""];
    @try {
        return [self.wcdb deleteAllObjectsFromTable:NSStringFromClass(model.class)];
    }@catch(NSException * e) {
        return NO;
    }
}

- (NSArray<SModel *> *)getAllObjectsFromTable:(SModel *)model {
    if (!model) {
        return nil;
    }
    
    @try {
        return [self.wcdb getAllObjectsOfClass:model.class fromTable:NSStringFromClass(model.class)];
    }@catch(NSException * e) {
        return nil;
    }
}

- (BOOL)updateObject:(SModel *)model {
    if (!model) {
        return NO;
    }
    
    @try {
        return [self.wcdb updateAllRowsInTable:NSStringFromClass(model.class) onProperties:[model.class AllProperties] withObject:model];
    }@catch(NSException * e) {
        return NO;
    }
}

@end
