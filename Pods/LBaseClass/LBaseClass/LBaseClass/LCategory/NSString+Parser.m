//
//  NSString+Parser.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/21.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "NSString+Parser.h"

@implementation NSString(Parser)

#pragma mark - Interface

+ (BOOL)isNullOrEmpty:(NSString *)string {
    return [string isEqual:[NSNull null]] || string.length == 0;
}

@end
