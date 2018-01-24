//
//  SLanguage.h
//  SelfSell
//
//  Created by liqiang on 2018/1/17.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SObject.h"

@interface SLanguage : SObject

/**
 获取支持语言
 */
- (NSArray *)getAppSupportLanguage;

/**
 获取APP当前语言
 */
- (NSString *)getAppDefaultLanguage;

/**
 设置当前语言
 */
//- (BOOL)setAppCurrentLanguage:(NSString *)languageCode;

@end
