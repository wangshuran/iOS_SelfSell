//
//  LModel.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LModel.h"
#import <objc/runtime.h>

@implementation LModel

#pragma mark - Interface

- (NSMutableSet *)propertyKeys {
    return [[self class] propertyKeys];
}

+ (NSMutableSet *)propertyKeys {
    NSMutableSet *keys = [[NSMutableSet alloc] init];
    Class aClass = self;
    
    while (YES) {
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList(aClass, &outCount);
        
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            [keys addObject:propertyName];
        }
        
        free(properties);
        
        if (aClass == [LObject class]) {
            break;
        }
        
        aClass = [aClass superclass];
    }
    
    return keys;
}


@end
