//
//  SRequest.h
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SModel.h"

@interface SRequest : SModel

/**
 编译号
 */
@property (nonatomic, copy) NSString * CFBundleVersion;

/**
 ID
 */
@property (nonatomic, copy) NSString * CFBundleIdentifier;

/**
 版本号
 */
@property (nonatomic, copy) NSString * CFBundleShortVersionString;

@end
