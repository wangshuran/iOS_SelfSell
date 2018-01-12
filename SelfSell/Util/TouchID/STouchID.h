//
//  STouchID.h
//  SelfSell
//
//  Created by liqiang on 2018/1/12.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SObject.h"
#import <LocalAuthentication/LocalAuthentication.h>

typedef void(^STouchIDOpenBlock)(BOOL status, BOOL isFallbackTitle, NSString * msg);

@interface STouchID : SObject

/**
 是否可以使用Touch ID
 */
- (BOOL)canPolicy;

/**
 是否可以使用Touch ID
 */
- (BOOL)canPolicy:(LAPolicy)policy;

/**
 验证Touch ID
 */
- (void)openTouchIDWithPolicy:(LAPolicy)policy fallbackTitle:(NSString *)fallbackTitle msg:(NSString *)msg touchIDBlock:(STouchIDOpenBlock)block;

@end
