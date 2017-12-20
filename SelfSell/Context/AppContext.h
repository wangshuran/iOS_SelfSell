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

/**
 语言类型
 */
@property (nonatomic, assign) Language language;

/**
 登录类型
 */
@property (nonatomic, assign) LoginType loginType;

/**
 用户信息
 */
@property (nonatomic, strong) SUserModel * userModel;

/**
 开启监听
 */
- (void)startMoniter;

/**
 获取顶层Controller
 */
- (UIViewController *)getTopController;

/**
 presentController
 */
- (void)presentViewController:(UIViewController *)viewControllerToPresent;

/**
 presentController
 */
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ )(void))completion;

@end
