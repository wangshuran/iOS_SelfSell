//
//  LViewController.h
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LInitProtocol.h"
#import "LReflectProtocol.h"

@interface LViewController : UIViewController<LInitProtocol, LReflectProtocol>

/**
 唯一标识
 */
@property (nonatomic, copy) NSString * uid;

/**
 创建时间
 */
@property (nonatomic, assign) NSTimeInterval createTime;

/**
 是否显示导航控制器
 */
@property (nonatomic, assign) BOOL hiddenNavbar;

/**
 是否显示导航控制器
 */
@property (nonatomic, assign) BOOL hiddenTabar;


/**
 设置导航栏背景颜色
 */
- (void)setNavbarBackgroundColor:(UIColor *)color;

/**
 设置导航栏返回按钮颜色
 */
- (void)setNavbarBackColor:(UIColor *)color;

/**
 设置导航栏标题颜色
 */
- (void)setNavbarTitleColor:(UIColor *)color;

@end
