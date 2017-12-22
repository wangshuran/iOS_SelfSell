//
//  NSObject+Category.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/22.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "NSObject+Category.h"

@implementation NSObject(Category)

#pragma mark - Interface

- (NSString *)className {
    return NSStringFromClass(self.class);
}

@end
