//
//  SLanguage.m
//  SelfSell
//
//  Created by liqiang on 2018/1/17.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SLanguage.h"

@implementation SLanguage

- (NSArray *)getAppSupportLanguage {
    NSString * path = [[LFile libraryPath] stringByAppendingPathComponent:@"SupportLanguage.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[self loadLanguage] writeToFile:path atomically:YES];
    }
    
    return [NSObject mj_objectArrayWithFile:path];
}

- (NSString *)getAppCurrentLanguage {
    NSArray * languages = [self getAppSupportLanguage];
    for (NSMutableDictionary * language in languages) {
        NSNumber * ischeck =  [language objectForKey:@"ischeck"];
        if (ischeck.boolValue) {
            return [language objectForKey:@"code"];
        }
    }
    
    return nil;
}

- (BOOL)setAppCurrentLanguage:(NSString *)languageCode {
    BOOL isDefault = NO;
    NSArray * languages = [self getAppSupportLanguage];
    for (NSMutableDictionary * language in languages) {
        [language setObject:[NSNumber numberWithBool:NO] forKey:@"ischeck"];
        if ([[language objectForKey:@"code"] isEqualToString:languageCode]) {
            [language setObject:[NSNumber numberWithBool:YES] forKey:@"ischeck"];
            isDefault = YES;
        }
    }
    if (isDefault) {
        NSString * path = [[LFile libraryPath] stringByAppendingPathComponent:@"SupportLanguage.plist"];
        isDefault = [languages writeToFile:path atomically:YES];
    }
    
    return isDefault;
}

#pragma mark - Private

/**
 初始化
 */
- (NSArray *)loadLanguage {
    NSMutableArray * languages = [[NSMutableArray alloc] init];
    {
        NSMutableDictionary * language = [[NSMutableDictionary alloc] initWithCapacity:4];
        [language setObject:[NSNumber numberWithInteger:LanguageSC] forKey:@"index"];
        [language setObject:@"zh-Hans" forKey:@"code"];
        [language setObject:@"简体中文" forKey:@"value"];
        [language setObject:[NSNumber numberWithBool:NO] forKey:@"ischeck"];
        [languages addObject:language];
    }{
        NSMutableDictionary * language = [[NSMutableDictionary alloc] initWithCapacity:4];
        [language setObject:[NSNumber numberWithInteger:LanguageEN] forKey:@"index"];
        [language setObject:@"en" forKey:@"code"];
        [language setObject:@"English" forKey:@"value"];
        [language setObject:[NSNumber numberWithBool:NO] forKey:@"ischeck"];
        [languages addObject:language];
    }
    BOOL isDefault = NO;
    NSString * code = [LLanguage getOSDefaultLanguage];
    for (NSMutableDictionary * language in languages) {
        if ([[language objectForKey:@"code"] isEqualToString:code]) {
            [language setObject:[NSNumber numberWithBool:YES] forKey:@"ischeck"];
            isDefault = YES;
            
            break;
        }
    }
    if (!isDefault) {
        for (NSMutableDictionary * language in languages) {
            //if ([[language objectForKey:@"code"] isEqualToString:@"zh-Hans"]) {
            if ([[language objectForKey:@"code"] isEqualToString:@"en"]) {
                [language setObject:[NSNumber numberWithBool:YES] forKey:@"ischeck"];
                
                break;
            }
        }
    }
    
    return languages;
}

@end
