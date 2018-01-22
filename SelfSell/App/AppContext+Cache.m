//
//  AppContext+Cache.m
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "AppContext+Cache.h"

@interface AppContext()

@end

@implementation AppContext(Cache)

#pragma mark - NSNotification

/**
 清除缓存通知
 */
- (void)noticeClearCache:(NSNotification *)notification {
    [[SDImageCache sharedImageCache] clearMemory];//清除内存缓存
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];//清除闪存缓存
    [self.languageCache removeAllObjects];
}

/**
 获取本地化语言
 */
- (NSString *)getLocalValue:(NSString *)key {
    NSString * k = [self.languageCode stringByAppendingString:key];
    NSString * v = [self.languageCache objectForKey:k];
    if (v) {
        return v;
    }
    
    NSString * path = [[NSBundle mainBundle] pathForResource:self.languageCode ofType:@"lproj"];
    v = [[NSBundle bundleWithPath:path] localizedStringForKey:key value:nil table:nil];
    [self.languageCache setObject:v forKey:k];
    
    return v;
}

@end
