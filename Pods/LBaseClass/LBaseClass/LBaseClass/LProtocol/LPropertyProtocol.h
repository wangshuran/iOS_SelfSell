//
//  LPropertyProtocol.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 liqiang. All rights reserved.
//

@protocol LPropertyProtocol <NSObject>

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

@end
