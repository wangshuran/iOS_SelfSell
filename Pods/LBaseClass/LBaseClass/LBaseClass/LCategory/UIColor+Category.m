//
//  UIColor+Category.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/15.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor(Category)


+ (UIColor *)randomColor {
    return [UIColor colorWithRed:arc4random_uniform(256) / 256.0f green:arc4random_uniform(256) / 256.0f blue:arc4random_uniform(256) / 256.0f alpha:arc4random_uniform(100) / 100.0f];
}
@end
