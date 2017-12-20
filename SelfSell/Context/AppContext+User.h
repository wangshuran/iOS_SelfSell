//
//  AppContext+User.h
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

@interface AppContext(User)

/**
 获取当前用户空间路径
 */
- (NSString *)getCurrentUserPath;

/**
 更新用户空间的数据
 */
- (void)updateUserInfo:(id)value key:(NSString *)key;

/**
 获取用户空间的数据
 */
- (id)getUserInfo:(NSString *)key;

@end
