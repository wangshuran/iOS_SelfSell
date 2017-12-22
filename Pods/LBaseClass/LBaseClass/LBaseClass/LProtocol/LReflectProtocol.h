//
//  LReflectProtocol.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/21.
//  Copyright © 2017年 liqiang. All rights reserved.
//

@protocol LReflectProtocol <NSObject>

@optional

/**
 属性键值集合
 
 @param isIncludeParent 是否包含父类
 */
- (NSMutableDictionary *)propertyKeyValues:(BOOL)isIncludeParent;

/**
 属性名称集合
 
 @param isIncludeParent 是否包含父类
 */
- (NSMutableSet *)propertyKeys:(BOOL)isIncludeParent;

/**
 属性名称集合
 
 @param isIncludeParent 是否包含父类
 */
+ (NSMutableSet *)propertyKeys:(BOOL)isIncludeParent;

/**
 反射
 */
- (BOOL)reflect:(NSObject *)obj;

@end
