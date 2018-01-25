//
//  AppDelegate.m
//  SelfSell
//
//  Created by liqiang on 2017/12/12.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "AppDelegate.h"
#import "SWelcomeController.h"
#import "SLoginByMailRequest.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Interface

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];//网络监听
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {//网络监听
        //if ([AppContext sharedAppContext].netStatus == AFNetworkReachabilityStatusUnknown) {
        //
        //}
        [AppContext sharedAppContext].netStatus = status;
    }];
    [[AppContext sharedAppContext] startMonitoring];//自定义监听
    __block SAccountModel * accountModel = [[AppContext sharedAppContext] getLastLoginAccount];
    if (!accountModel) {
        accountModel = [[SAccountModel alloc] init];
        accountModel.loginTime = [[NSDate date] timeIntervalSince1970];
        accountModel.isLogout = YES;
        [[AppContext sharedAppContext] updateLoginAccount:accountModel];
    }
    if (!accountModel.isLogout) {//更新token
        if (accountModel.loginType == LoginTypeAccount) {
            SLoginByMailRequest * request = [[SLoginByMailRequest alloc] init];
            request.email = accountModel.email;
            request.password = accountModel.pwd;
            //request.googleAuthCode = pwd;
            [SNetwork request:request block:^(LRequest * request, LResponse * response) {
                if (!response.status) {
                    accountModel.isLogout = YES;
                }else {
                    SLoginByMailResponse * model = (SLoginByMailResponse *)response;
                    model.data.loginType = LoginTypeAccount;
                    model.data.loginTime = [[NSDate date] timeIntervalSince1970];
                    accountModel = model.data;
                }
                [AppContext sharedAppContext].accountModel = accountModel;
                [[AppContext sharedAppContext] updateLoginAccount:accountModel];
                [[AppContext sharedAppContext] initDB];
                
                self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
                self.window.rootViewController = [AppContext sharedAppContext].rootVC;
                [self.window makeKeyAndVisible];
                
                SPostNotification(kNoticeShowVersionCheck);//版本检查通知
                SPostNotification(kNoticeShowSecurityCheck);//安全检查通知
            }];
        }
    }else {
        [AppContext sharedAppContext].accountModel = accountModel;
        [[AppContext sharedAppContext] initDB];
        
        self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        self.window.rootViewController = [AppContext sharedAppContext].rootVC;
        [self.window makeKeyAndVisible];
        
        SPostNotification(kNoticeShowVersionCheck);//版本检查通知
        SPostNotification(kNoticeShowSecurityCheck);//安全检查通知
    }
    
    return YES;
}

/**
 暂行
 */
- (void)applicationWillResignActive:(UIApplication *)application {
}

/**
 进入后台
 */
- (void)applicationDidEnterBackground:(UIApplication *)application {
}

/**
 进入前台
 */
- (void)applicationWillEnterForeground:(UIApplication *)application {
    SPostNotification(kNoticeShowSecurityCheck);//安全检查通知
}

/**
 激活
 */
- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Private

@end
