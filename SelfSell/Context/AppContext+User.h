//
//  AppContext+Account.h
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

@interface AppContext(User)

/**
 获取当前用户表示
 */
- (NSString *)getCurrentAccountID;

/**
 获取当前用户空间路径
 */
- (NSString *)getCurrentAccountSpacePath;

/**
 更新用户空间的数据
 */
- (void)updateCurrentAccountSpaceInfo:(id)value key:(NSString *)key;

/**
 获取用户空间的数据
 */
- (id)getCurrentAccountSpaceInfo:(NSString *)key;

/**
 更新登录用户信息
 */
- (void)updateLoginAccount:(SAccountModel *)accountModel;

/**
 获取最后登录用户
 */
- (SAccountModel *)getLastLoginAccount;

/**
 获取全部登录用户
 */
- (NSArray<SAccountModel *> *)getLoginAccounts;

@end
