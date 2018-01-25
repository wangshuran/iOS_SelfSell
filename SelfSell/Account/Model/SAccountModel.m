//
//  SAccountModel.m
//  SelfSell
//
//  Created by liqiang on 2017/12/26.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SAccountModel.h"

@implementation SAccountModel

#pragma mark - Interface

- (void)setLanguageCode:(NSString *)languageCode {
    SLanguage * language = [[SLanguage alloc] init];
    NSArray * languages = [language getAppSupportLanguage];
    
    for (NSDictionary * language in languages) {
        if ([languageCode hasPrefix:[language objectForKey:@"code"]]) {
            NSString * index = [NSString stringWithFormat:@"%@", [language objectForKey:@"index"]];
            _language = index.intValue;
            _languageCode = [language objectForKey:@"code"];
            
            break;
        }
    }
    
    if (!_languageCode) {
        NSDictionary * language = [languages objectAtIndex:0];
        NSString * index = [NSString stringWithFormat:@"%@", [language objectForKey:@"index"]];
        _language = index.intValue;
        _languageCode = [language objectForKey:@"code"];
    }
}

- (BOOL)isLoginUser {
    return !self.isLogout && self.loginType != LoginTypeNone && ![NSString isNullOrEmpty:self.token];
}

+ (instancetype)getVisitor {
    SAccountModel * accountModel = [[SAccountModel alloc] init];
    accountModel.loginTime = [[NSDate date] timeIntervalSince1970];
    accountModel.isLogout = YES;
    return accountModel;
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    self.id = [UIDevice currentDevice].uniqueDeviceIdentifier;
    self.loginType = LoginTypeNone;
    self.languageCode = [[[SLanguage alloc] init] getAppDefaultLanguage];
    self.isLogout = NO;
    self.googleAuthStatus = @"OFF";
}

@end
