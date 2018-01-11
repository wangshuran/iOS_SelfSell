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

WCDB_SYNTHESIZE(SModel, uid)
WCDB_SYNTHESIZE(SModel, createTime)
WCDB_SYNTHESIZE(SModel, displayOrder)
WCDB_SYNTHESIZE(SModel, version)

- (NSMutableSet *)collectionPropertyKeys {
    Class aClass = self.class;
    NSMutableSet * propertyKeys = [self propertyKeys:YES];
    NSMutableSet * keys = [[NSMutableSet alloc] init];
    
    for (NSString * key in propertyKeys) {
        objc_property_t property = class_getProperty(aClass, [key UTF8String]);
        const char *attr = property_getAttributes(property);
        NSString *strAttr = [NSString stringWithUTF8String:attr];
        
        if ([strAttr rangeOfString:NSStringFromClass([NSArray class])].location != NSNotFound || [strAttr rangeOfString:NSStringFromClass([NSMutableArray class])].location != NSNotFound || [strAttr rangeOfString:NSStringFromClass([NSSet class])].location != NSNotFound || [strAttr rangeOfString:NSStringFromClass([NSMutableSet class])].location != NSNotFound) {
            [keys addObject:key];
        }
    }
    
    return keys.count > 0 ? keys : nil;
}


@end
