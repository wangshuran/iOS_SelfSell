//
//  LTest.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/25.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LTest.h"
#import "UIColor+Category.h"

@implementation LTest

#pragma mark - Interface

+ (void)randomColorView:(UIView *)view {
    view.backgroundColor = [UIColor randomColor];
    for (UIView * subView in view.subviews) {
        [LTest randomColorView:subView];
    }
}


#pragma mark - Private


@end
