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
 获取APP默认语言
 */
- (NSString *)getAppDefaultLanguage;



@end
