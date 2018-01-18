//
//  LLanguage.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/26.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LLanguage.h"

@implementation LLanguage

#pragma mark - Interface

+ (NSString *)getOSDefaultLanguage {
    NSArray * appLanguages = [NSUserDefaults.standardUserDefaults objectForKey:@"AppleLanguages"];
    
    return appLanguages.firstObject;
}

+ (NSArray<NSString *> *)getOSSupportLanguage {
    return [NSLocale availableLocaleIdentifiers];
}

@end
