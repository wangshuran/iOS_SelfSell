//
//  LContext.h
//  LBaseClass
//
//  Created by liqiang on 2017/11/30.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LObject.h"
#import "LSingleton.h"

@interface LContext : LObject

/**
 获取顶层Controller
 */
+ (UIViewController *)getTopController;

/**
 presentController
 */
+ (void)presentViewController:(UIViewController *)viewControllerToPresent;

/**
 presentController
 */
+ (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ )(void))completion;

@end
