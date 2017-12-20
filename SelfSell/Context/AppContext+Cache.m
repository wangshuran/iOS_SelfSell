//
//  AppContext+Cache.m
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "AppContext+Cache.h"

@implementation AppContext(Cache)

#pragma mark - NSNotification

/**
 清除缓存通知
 */
- (void)noticeClearCache:(NSNotification *)notification {
    [[SDImageCache sharedImageCache] clearMemory];//清除内存缓存
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];//清除闪存缓存
}

@end
