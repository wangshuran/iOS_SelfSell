//
//  LSystemInfo.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/12.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LSystemInfo.h"

@implementation LSystemInfo

+ (BOOL)higheriOS9 {
    return [self systemVersion] >= 9.0f;
}

+ (BOOL)higheriOS10 {
    return [self systemVersion] >= 10.0f;
}

+ (BOOL)higheriOS11 {
    return [self systemVersion] >= 11.0f;
}

+ (float)systemVersion {
    return [UIDevice currentDevice].systemVersion.floatValue;
}

@end
