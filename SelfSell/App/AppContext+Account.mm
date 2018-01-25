//
//  AppContext+Account.m
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "AppContext+Account.h"
#import "SLoginByMailController.h"
#import "SCheckVersionView.h"
#import "STouchID.h"
#import "SDao+Category.h"
#import "SCommonModel+WCTTableCoding.h"

@implementation AppContext(Account)

#pragma mark - Interface

- (NSString *)getCurrentAccountID {
    return [self.accountModel.id MD5];
}

- (NSString *)getCurrentAccountSpacePath {
    NSString * path = [[LFile libraryPath] stringByAppendingPathComponent:[self getCurrentAccountID]];
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path]) {
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return path;
}

- (NSString *)getCommonAccountSpacePath {
    NSString * path = [[LFile libraryPath] stringByAppendingPathComponent:[@"common" MD5]];
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path]) {
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return path;
}

- (void)updateCurrentAccountSpaceInfo:(id)value key:(NSString *)key {    
    if ([NSString isNullOrEmpty:key] || value == nil || [value isEqual:[NSNull null]]) {
        return;
    }
    
    NSString * accountIdentifier = [self.accountModel.id MD5];
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
    if ([NSString isNullOrEmpty:key]) {
        return nil;
    }
    
    NSString * accountIdentifier = [self.accountModel.id MD5];
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
        
        [info setObject:[accountModel getParameter] forKey:[accountModel.id MD5]];
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
            SAccountModel * accountModel = [SAccountModel mj_objectWithKeyValues:accountInfo];
            if (accountModel.loginTime >= model.loginTime) {
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
            SAccountModel * accountModel = [SAccountModel mj_objectWithKeyValues:accountInfo];
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
 显示安全检查通知
 */
- (void)noticeShowSecurityCheck:(NSNotification *)notification {
    SCommonModel * commonModel = (SCommonModel *)[[AppContext sharedAppContext].accountDao getObjectFromTable:[[SCommonModel alloc] init] condition:SCommonModel.key == kIsOpenTouchID];
    if (commonModel.value.boolValue) {
        STouchID * touch = [[STouchID alloc] init];
        if ([touch canPolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics]) {
            //此处最好加独占锁，防止连续发送两次通知，弹出两个登录视图
            //SLoginController * vc = [[SLoginController alloc] init];
            //SNavigationController * nav = [[SNavigationController alloc] initWithRootViewController:vc];
            //[UIViewController present:nav animated:NO completion:^(){
            //
            //}];
        }else {
            
        }
    }
}

/**
 去登录通知
 */
- (void)noticeToLogin:(NSNotification *)notification {
    //此处最好加独占锁，防止连续发送两次通知，弹出两个登录视图
    SLoginByMailController * vc = [[SLoginByMailController alloc] init];
    SNavigationController * nav = [[SNavigationController alloc] initWithRootViewController:vc];
    [UIViewController present:nav animated:YES completion:^(){
        
    }];
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
    UIAlertController * vc = [UIAlertController alertControllerWithTitle:SLocal(@"common_tishi") message:SLocal(@"common_querenyaotuichuma") preferredStyle:UIAlertControllerStyleAlert];
    [vc addAction:[UIAlertAction actionWithTitle:SLocal(@"common_zhuxiao") style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [[AppContext sharedAppContext].accountDao close];
        [AppContext sharedAppContext].accountDao = nil;
        [AppContext sharedAppContext].accountModel = [SAccountModel getVisitor];
        [[AppContext sharedAppContext] updateLoginAccount:[AppContext sharedAppContext].accountModel];
        [[AppContext sharedAppContext] initDB];
        [[AppContext sharedAppContext] setSelectVC:[AppContext sharedAppContext].activityNav];
        SPostNotification(kNoticeFinishLogout);
    }]];
    [vc addAction:[UIAlertAction actionWithTitle:SLocal(@"common_quxiao") style:UIAlertActionStyleCancel handler:nil]];
    [UIViewController present:vc];
}

/**
 完成登出通知
 */
- (void)noticeFinishLogout:(NSNotification *)notification {
    
}

/**
 切换语言通知
 */
- (void)noticeSwitchLanguage:(NSNotification *)notification {    
    self.activityNav = nil;
    self.fundNav = nil;
    self.accountNav = nil;
    
    self.activityVC = nil;
    self.fundVC = nil;
    self.setting0VC = nil;
    
    [self reloadRootVC];
}

@end
