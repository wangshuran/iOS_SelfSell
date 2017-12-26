//
//  AppContext+Account.m
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "AppContext+Account.h"
#import "SLoginController.h"
#import "SCheckVersionView.h"

@implementation AppContext(Account)

#pragma mark - Interface

- (NSString *)getCurrentAccountID {
    NSString * accountIdentifier = self.loginType == LoginTypeNone ? [[UIDevice currentDevice] uniqueDeviceIdentifier] : self.accountModel.accountID;
    
    return [accountIdentifier MD5];
}

- (NSString *)getCurrentAccountSpacePath {
    NSString * libraryPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library"];    
    NSString * selfsellPath = [libraryPath stringByAppendingPathComponent:[self getCurrentAccountID]];
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:selfsellPath]) {
        [fileManager createDirectoryAtPath:selfsellPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return selfsellPath;
}

- (void)updateCurrentAccountSpaceInfo:(id)value key:(NSString *)key {
    if (key.length == 0 || value == nil || [value isEqual:[NSNull null]]) {
        return;
    }
    
    NSString * accountIdentifier = self.loginType == LoginTypeNone ? [[UIDevice currentDevice] uniqueDeviceIdentifier] : self.accountModel.accountID;
    accountIdentifier = [accountIdentifier MD5];
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    @synchronized(self) {
        NSMutableDictionary * info = [userDefaults objectForKey:accountIdentifier];
        
        if (info) {
            info = [info mutableCopy];
        }else {
            info = [[NSMutableDictionary alloc] init];
        }
        
        [info setObject:value forKey:key];
        [userDefaults setObject:info forKey:accountIdentifier];
        [userDefaults synchronize];
    }
}

- (id)getCurrentAccountSpaceInfo:(NSString *)key {
    if (key.length == 0) {
        return nil;
    }
    
    NSString * accountIdentifier = self.loginType == LoginTypeNone ? [[UIDevice currentDevice] uniqueDeviceIdentifier] : self.accountModel.accountID;
    accountIdentifier = [accountIdentifier MD5];
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    @synchronized(self) {
        NSDictionary * info = [userDefaults objectForKey:accountIdentifier];
        
        if (info == nil) {
            return nil;
        }
        
        return [info objectForKey:key];
    }
}

- (void)updateLoginAccount:(SAccountModel *)accountModel {
    if (accountModel == nil) {
        return;
    }

    NSString * identifier = [@"loginlist" MD5];
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    @synchronized(self) {
        NSMutableDictionary * info = [userDefaults objectForKey:identifier];
        
        if (info) {
            info = [info mutableCopy];
        }else {
            info = [[NSMutableDictionary alloc] init];
        }
        
        [info setObject:[accountModel getParameter] forKey:[accountModel.accountID MD5]];
        [userDefaults setObject:info forKey:identifier];
        [userDefaults synchronize];
    }
}

- (SAccountModel *)getLastLoginAccount {
    NSString * identifier = [@"loginlist" MD5];
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    @synchronized(self) {
        NSDictionary * info = [userDefaults objectForKey:identifier];
        if (!info) {
            return nil;
        }
        
        SAccountModel * model = nil;
        
        for (NSDictionary * accountInfo in info.allValues) {
            SAccountModel * accountModel = [[SAccountModel alloc] init];
            [accountModel reflect:accountInfo];
            
            if (accountModel.loginTime > model.loginTime) {
                model = accountModel;
            }
        }
        
        return model;
    }
}

- (NSArray<SAccountModel *> *)getLoginAccounts {
    NSString * identifier = [@"loginlist" MD5];
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    @synchronized(self) {
        NSDictionary * info = [userDefaults objectForKey:identifier];
        if (!info) {
            return nil;
        }
        
        NSMutableArray<SAccountModel *> * models = [[NSMutableArray alloc] initWithCapacity:info.count];
        
        for (NSDictionary * accountInfo in info.allValues) {
            SAccountModel * accountModel = [[SAccountModel alloc] init];
            [accountModel reflect:accountInfo];
            
            [models addObject:accountModel];
        }
        
        return models.count > 0 ? models : nil;
    }
}

#pragma mark - NSNotification

/**
 显示版本检查通知
 */
- (void)noticeShowVersionCheck:(NSNotification *)notification {
    SCheckVersionView * view = [[SCheckVersionView alloc] init];
    view.frame = [UIScreen mainScreen].bounds;
    [[UIApplication sharedApplication].keyWindow addSubview:view];
}
    
/**
 去登录通知
 */
- (void)noticeToLogin:(NSNotification *)notification {
    //此处最好加独占锁，防止连续发送两次通知，弹出两个登录视图
    SLoginController * vc = [[SLoginController alloc] init];
    SNavigationController * nav = [[SNavigationController alloc] initWithRootViewController:vc];
    [UIViewController present:nav];
}

/**
 完成登录通知
 */
- (void)noticeFinishLogin:(NSNotification *)notification {
    
}

/**
 去登出通知
 */
- (void)noticeToLogout:(NSNotification *)notification {
    
}

/**
 完成登出通知
 */
- (void)noticeFinishLogout:(NSNotification *)notification {
    
}

@end
