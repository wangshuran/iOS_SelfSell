//
//  AppContext.h
//  SelfSell
//
//  Created by liqiang on 2017/12/12.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import <LBaseClass/LBaseClass.h>

@interface AppContext : LObject

/**
 根控制器
 */
@property (nonatomic, strong) LTabBarController *rootVC;

/**
 DEMO_N1
 */
@property (nonatomic, strong) LNavigationController *n1VC;

@end
