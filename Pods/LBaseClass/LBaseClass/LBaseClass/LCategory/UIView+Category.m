//
//  UIView+Category.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/19.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "UIView+Category.h"
#import "LDefine.h"

@implementation UIView(Category)

#pragma mark - Interface

- (void)printViewTree {
    [self printViewTreeWithPre:@""];
}

#pragma mark - Private

- (void)printViewTreeWithPre:(NSString *)pre{
    _logBlue(@"%@%@", pre, NSStringFromClass(self.class));
    
    for (UIView * temp in self.subviews) {
        [temp printViewTreeWithPre:[pre stringByAppendingString:@"  |"]];
    }
}

@end
