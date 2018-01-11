//
//  LAppInfo.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LObject.h"

@interface LAppInfo : LObject

/**
 包ID
 */
+ (NSString *)CFBundleIdentifier;

/**
 版本号
 */
+ (NSString *)CFBundleShortVersionString;

/**
 编译号
 */
+ (NSString *)CFBundleVersion;

@end
