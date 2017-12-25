//
//  AppContext.h
//  SelfSell
//
//  Created by liqiang on 2017/12/12.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SObject.h"
#import "SUserModel.h"

/**
 上下文
 */
@interface AppContext : SObject

LSingleton_h(AppContext);

/**
 根控制器
 */
@property (nonatomic, strong) STabBarController * rootVC;

/**
 DEMO_N1
 */
@property (nonatomic, strong) SNavigationController * n1VC;
@property (nonatomic, strong) SNavigationController * n2VC;
@property (nonatomic, strong) SNavigationController * n3VC;
@property (nonatomic, strong) SNavigationController * n4VC;
@property (nonatomic, strong) SNavigationController * n5VC;

/**
 语言类型
 */
@property (nonatomic, assign) Language language;

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
@property (nonatomic, strong) SUserModel * userModel;

/**
 主机地址
 */
@property (nonatomic, copy) NSString * host;

/**
 国际化缓存
 */
@property (nonatomic, strong) NSMutableDictionary * languageCache;

/**
 开启监听
 */
- (void)startMonitoring;

@end
