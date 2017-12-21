//
//  UIViewController+Category.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/21.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController(Category)

/**
 获取顶层VC
 */
+ (UIViewController *)getTopController;

/**
 presentVC
 */
+ (void)present:(UIViewController *)vc;

/**
 presentVC
 */
- (void)present:(UIViewController *)vc;

/**
 presentVC
 */
+ (void)present:(UIViewController *)vc animated:(BOOL)animated completion:(void (^ )(void))completion;

/**
 presentVC
 */
- (void)present:(UIViewController *)vc animated:(BOOL)animated completion:(void (^ )(void))completion;

/**
 pushVC
 */
- (void)push:(UIViewController *)vc;

/**
 pushVC
 */
- (void)push:(UIViewController *)vc animated:(BOOL)animated;

/**
 popVC
 */
- (void)pop;

/**
 popVC
 */
- (void)pop:(BOOL)animated;

@end
