//
//  AppDelegate.m
//  SelfSell
//
//  Created by liqiang on 2017/12/12.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "AppDelegate.h"
#import "SWelcomeController.h"


#import "SLoginByMailResponse.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Interface

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    AFNetworkReachabilityManager * afManager = [AFNetworkReachabilityManager sharedManager];
    [afManager startMonitoring];
    [afManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {//网络监听
        //if ([AppContext sharedAppContext].netStatus == AFNetworkReachabilityStatusUnknown) {
        //
        //}
        
        [AppContext sharedAppContext].netStatus = status;
    }];
    [[AppContext sharedAppContext] startMonitoring];//自定义监听
    SAccountModel * accountModel = [[AppContext sharedAppContext] getLastLoginAccount];
    if (!accountModel) {
        accountModel = [[SAccountModel alloc] init];
        accountModel.loginTime = [[NSDate date] timeIntervalSince1970];
        [[AppContext sharedAppContext] updateLoginAccount:accountModel];
    }
    [AppContext sharedAppContext].accountModel = accountModel;
    [self initDB];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [AppContext sharedAppContext].rootVC;
    [self.window makeKeyAndVisible];
    
    //SLoginByAccountRequest * request = [[SLoginByAccountRequest alloc] init];
    ////TODO，属性赋值
    //
    //[LNetwork request:request block:^(LRequest * request, LResponse * response) {
    //    if (!response.status) {
    //        [AppContext sharedAppContext].loginType = LoginTypeNone;
    //        [AppContext sharedAppContext].accountModel = nil;
    //        NSString * languageCode = [[AppContext sharedAppContext] getCurrentAccountSpaceInfo:kCurrentLanguageCode];
    //        if (!languageCode) {
    //            languageCode = [LLanguage getOSDefaultLanguage];
    //        }
    //        [AppContext sharedAppContext].languageCode = languageCode;
    //        //TODO，继续其他操作
    //    } else {
    //        SAccountModel * accountModel = ((SLoginByAccountResponse *)response).accountModel;
    //        //TODO，不一定只有账户登录
    //        [AppContext sharedAppContext].loginType = LoginTypeAccount;
    //        [AppContext sharedAppContext].accountModel = accountModel;
    //        NSString * languageCode = [[AppContext sharedAppContext] getCurrentAccountSpaceInfo:kCurrentLanguageCode];
    //        if (!languageCode) {
    //            languageCode = [LLanguage getOSDefaultLanguage];
    //        }
    //        [AppContext sharedAppContext].languageCode = languageCode;
    //        [[AppContext sharedAppContext] updateLoginAccount:accountModel];
    //        //TODO，继续其他操作
    //    }
    //
    //    SPostNotification(kNoticeFinishLogin);//完成登录发出通知
    //    SPostNotification(kNoticeShowVersionCheck);//版本检查通知
    //    SPostNotification(kNoticeShowSecurityCheck);//安全检查通知
    //}];
    
    //[self.window.rootViewController present:[[SNavigationController alloc] initWithRootViewController:[[NSClassFromString(@"SLoginByMailController") alloc] init]]];
    //[self.window.rootViewController present:[[SWelcomeController alloc] init] animated:NO completion:nil];
    

    
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

/**
 初始化数据库
 */
- (void)initDB {
    [[AppContext sharedAppContext].commonDao createTable:[[SModel alloc] init]];
    [[AppContext sharedAppContext].commonDao createTable:[[SCommonModel alloc] init]];
    //[[AppContext sharedAppContext].commonDao createTable:[[SAccountModel alloc] init]];
    
    [[AppContext sharedAppContext].accountDao createTable:[[SModel alloc] init]];
    [[AppContext sharedAppContext].accountDao createTable:[[SCommonModel alloc] init]];
    //[[AppContext sharedAppContext].accountDao createTable:[[SAccountModel alloc] init]];
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * lastInitDBVersion = [userDefaults objectForKey:kLastInitDBVersion];
    if (![lastInitDBVersion isEqualToString:[LAppInfo CFBundleShortVersionString]]) {
        {
            SCommonModel * model = [[SCommonModel alloc] init];
            model.key = kLastWelcomeVersion;
            model.value = @"";
            [[AppContext sharedAppContext].commonDao insertObject:model];
        }{
            SCommonModel * model = [[SCommonModel alloc] init];
            model.key = kIsOpenTouchID;
            model.value = @"0";
            [[AppContext sharedAppContext].accountDao insertObject:model];
        }
        
        [userDefaults setObject:[LAppInfo CFBundleShortVersionString] forKey:kLastInitDBVersion];
        [userDefaults synchronize];
    }
}

@end
