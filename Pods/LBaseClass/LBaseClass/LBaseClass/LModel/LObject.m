//
//  LObject.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LObject.h"
#import "LDefine.h"
#import <objc/runtime.h>

@implementation LObject

#pragma mark - Interface

//liqiang
//+ (void)load {
//    _logImport()
//}

- (instancetype)init {
    self = [super init];
    
    [self initialize];
    
    return self;
}

- (NSString *)description {
    _logRetainCount(self);
    
    return [NSString stringWithFormat:@"class:%@__uid:%@__createTime:%f", self.class, self.uid, self.createTime];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    _logImport();
}

#pragma mark - LInitProtocol

- (void)initialize {
    //static dispatch_once_t onceToken;
    //dispatch_once(&onceToken, ^{
    if (self.uid) {
        @throw [NSException exceptionWithName:[NSString stringWithFormat:@"repeat execute %@", NSStringFromSelector(_cmd)] reason:[NSString stringWithFormat:@"repeat execute %@", NSStringFromSelector(_cmd)] userInfo:nil];
    }
    
    self.uid = [NSUUID UUID].UUIDString;
    self.createTime = [[NSDate date] timeIntervalSince1970];
    //});
}

#pragma mark - LReflectProtocol

- (NSMutableDictionary *)propertyKeyValues:(BOOL)isIncludeParent {
    NSMutableSet * keys = [self propertyKeys:isIncludeParent];
    NSMutableDictionary * keyValues = [[NSMutableDictionary alloc] initWithCapacity:keys.count];
    
    for (NSString * key in keys) {
        id value = [self valueForKey:key];
        if ([value isEqual:[NSNull null]] || value == nil) {
            continue;
        }
        
        [keyValues setObject:value forKey:key];
    }
    
    return keyValues.count == 0 ? nil : keyValues;
}

- (NSMutableSet *)propertyKeys:(BOOL)isIncludeParent {
    return [self.class propertyKeys:isIncludeParent];
}

+ (NSMutableSet *)propertyKeys:(BOOL)isIncludeParent {
    NSMutableSet * keys = [[NSMutableSet alloc] init];
    Class aClass = self;
    
    while (YES) {
        unsigned int outCount, i;
        objc_property_t * properties = class_copyPropertyList(aClass, &outCount);
        
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            NSString * propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            [keys addObject:propertyName];
        }
        
        free(properties);
        
        if (!isIncludeParent || aClass == nil || aClass == LObject.class) {
            break;
        }
        
        aClass = aClass.superclass;
    }
    
    return keys.count == 0 ? nil : keys;
}

- (NSMutableSet *)collectionPropertyKeys:(BOOL)isIncludeParent {
    return [self.class collectionPropertyKeys:isIncludeParent];
}

+ (NSMutableSet *)collectionPropertyKeys:(BOOL)isIncludeParent {
    Class aClass = self;
    
    NSMutableSet * propertyKeys = [aClass propertyKeys:isIncludeParent];
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

- (BOOL)reflect:(NSDictionary *)obj {
    NSMutableSet * keys = [self propertyKeys:YES];
    for (NSString * key in keys) {
        id value = [obj valueForKey:key];
        if ([value isEqual:[NSNull null]] || value == nil) {
            continue;
        }
        
        [self setValue:value forKey:key];
    }
    
    return YES;
}

#pragma mark - LSerializableProtocol

- (NSString *)getJSON {
    return nil;
}

- (NSString *)getXML {
    return nil;
}

- (NSString *)getQuery {
    return nil;
}

- (NSMutableDictionary *)getParameter {
    return nil;
}

@end
