//
//  UIColor+Category.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/15.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(Category)

/**
 获取随机颜色
 */
+ (UIColor *)randomColor;

/**
 获取R值
 */
- (CGFloat)getR;

/**
 获取G值
 */
- (CGFloat)getG;

/**
 获取B值
 */
- (CGFloat)getB;

/**
 获取A值
 */
- (CGFloat)getA;

/**
 是否是深颜色
 */
- (BOOL)isDark;

@end
