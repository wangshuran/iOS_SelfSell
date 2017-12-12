//
//  LContext.h
//  LBaseClass
//
//  Created by liqiang on 2017/11/30.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LObject.h"

@interface LContext : LObject

/**
 获取包ID
 */
- (NSString *)getBundleIdentifier;

/**
 获取APP版本号
 */
- (NSString *)getCurrentVersionInBundle;

/**
 获取最顶层ViewController
 */
- (UIViewController *)getTopViewController;

@end
