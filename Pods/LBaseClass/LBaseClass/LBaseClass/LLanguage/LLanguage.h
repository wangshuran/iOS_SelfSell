//
//  LLanguage.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/26.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LObject.h"

@interface LLanguage : LObject

/**
 获取系统默认语言
 */
+ (NSString *)getOSDefaultLanguage;

/**
 获取系统支持语言
 */
+ (NSArray<NSString *> *)getOSSupportLanguage;

@end
