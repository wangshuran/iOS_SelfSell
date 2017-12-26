//
//  AppContext+Cache.h
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

@interface AppContext(Cache)

/**
 获取本地化语言（有缓存）
 */
- (NSString *)getLocalValue:(NSString *)key;

@end
