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
 语言类型
 */
@property (nonatomic, assign, readonly) Language language;

/**
 语言类型代码
 */
@property (nonatomic, copy) NSString * languageCode;

/**
 网络状态
 */
@property (nonatomic, assign) AFNetworkReachabilityStatus netStatus;

/**
 登录类型
 */
@property (nonatomic, assign) LoginType loginType;

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

@end
