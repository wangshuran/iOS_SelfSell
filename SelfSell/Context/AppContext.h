//
//  AppContext.h
//  SelfSell
//
//  Created by liqiang on 2017/12/12.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import <LBaseClass/LBaseClass.h>


typedef enum : NSUInteger {
    LanguageNone,//未知
    LanguageEN,//英文
    LanguageTC,//繁体中文
    LanguageSC,//简体中文
} Language;


/**
 上下文
 */
@interface AppContext : LObject


/**
 根控制器
 */
@property (nonatomic, strong) STabBarController *rootVC;

/**
 DEMO_N1
 */
@property (nonatomic, strong) SNavigationController *n1VC;

/**
 当前语言
 */
@property (nonatomic, assign) Language language;

@end
