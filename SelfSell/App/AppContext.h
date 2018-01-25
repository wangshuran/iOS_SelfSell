//
//  AppContext.h
//  SelfSell
//
//  Created by liqiang on 2017/12/12.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SObject.h"
#import "SFundController.h"
#import "SActivityController.h"
#import "SSetting0Controller.h"
#import "SLanguage.h"

/**
 上下文
 */
@interface AppContext : SObject

LSingleton_h(AppContext);

/**
 根控制器
 */
@property (nonatomic, strong) STabBarController * rootVC;

@property (nonatomic, strong) SNavigationController * activityNav;
@property (nonatomic, strong) SNavigationController * fundNav;
@property (nonatomic, strong) SNavigationController * accountNav;

@property (nonatomic, strong) SActivityController * activityVC;
@property (nonatomic, strong) SFundController * fundVC;
@property (nonatomic, strong) SSetting0Controller * setting0VC;

/**
 网络状态
 */
@property (nonatomic, assign) AFNetworkReachabilityStatus netStatus;

/**
 用户信息
 */
@property (nonatomic, strong) SAccountModel * accountModel;

/**
 用户数据库
 */
@property (nonatomic, strong) SDao * accountDao;

/**
 通用数据库
 */
@property (nonatomic, strong) SDao * commonDao;

/**
 主机地址
 */
@property (nonatomic, copy) NSString * host;

/**
 国际化缓存
 */
@property (nonatomic, strong, readonly) NSMutableDictionary * languageCache;

/**
 开启监听
 */
- (void)startMonitoring;

/**
 重新加载根控制器
 */
- (void)reloadRootVC;

/**
 初始化数据库
 */
- (void)initDB;

@end
