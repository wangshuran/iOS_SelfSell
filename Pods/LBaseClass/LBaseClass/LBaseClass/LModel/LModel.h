//
//  LModel.h
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LObject.h"

@interface LModel : LObject

/**
 显示排序
 */
@property (nonatomic, strong) NSString *displayOrder;

/**
 数据版本号
 */
@property (nonatomic, strong) NSString *dataVersion;

/**
 属性名称集合
 */
- (NSMutableSet *)propertyKeys;

/**
 属性名称集合
 */
+ (NSMutableSet *)propertyKeys;


@end
