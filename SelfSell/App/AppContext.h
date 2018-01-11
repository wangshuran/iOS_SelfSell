//
//  AppContext.h
//  SelfSell
//
//  Created by liqiang on 2017/12/12.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SObject.h"
#import "STalentsController.h"
#import "SMarketController.h"
#import "SVotesController.h"
#import "SViewsController.h"
#import "SSettingController.h"
#import "SAccountModel.h"

/**
 上下文
 */
@interface AppContext : SObject

LSingleton_h(AppContext);

/**
 根控制器
 */
@property (nonatomic, strong) STabBarController * rootVC;

@property (nonatomic, strong) SNavigationController * talentsNav;
@property (nonatomic, strong) SNavigationController * marketNav;
@property (nonatomic, strong) SNavigationController * votesNav;
@property (nonatomic, strong) SNavigationController * viewsNav;
@property (nonatomic, strong) SNavigationController * accountNav;

@property (nonatomic, strong) STalentsController * talentsVC;
@property (nonatomic, strong) SMarketController * marketVC;
@property (nonatomic, strong) SVotesController * votesVC;
@property (nonatomic, strong) SViewsController * viewsVC;
@property (nonatomic, strong) SSettingController * settingVC;

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
@property (nonatomic, strong) SDao * dao;

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
 获取支持语言
 */
- (NSArray *)getAppSupportLanguage;

@end
