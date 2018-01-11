//
//  LAppInfo.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LAppInfo.h"

@implementation LAppInfo

#pragma mark - Interface

+ (NSString *)CFBundleIdentifier {
    return [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleIdentifier"];
}

+ (NSString *)CFBundleShortVersionString {
    return [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)CFBundleVersion {
    return [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleVersion"];
}





@end
