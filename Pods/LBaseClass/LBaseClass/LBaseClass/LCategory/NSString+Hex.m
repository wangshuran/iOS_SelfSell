//
//  NSString+Hex.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "NSString+Hex.h"
#import "NSData+Hex.h"

@implementation NSString(Hex)

#pragma mark - Interface

- (NSString *)toHex {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data toHex];
}

@end
