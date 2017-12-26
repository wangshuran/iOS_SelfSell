//
//  AppDelegate.m
//  SelfSell
//
//  Created by liqiang on 2017/12/12.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "AppDelegate.h"
#import "SLoginByAccountRequest.h"

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
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [AppContext sharedAppContext].rootVC;
    [self.window makeKeyAndVisible];
    
    SLoginByAccountRequest * request = [[SLoginByAccountRequest alloc] init];
    //TODO，属性赋值
    
    [LNetwork request:request block:^(LRequest * request, LResponse * response) {
        if (!response.status) {
            [AppContext sharedAppContext].loginType = LoginTypeNone;
            [AppContext sharedAppContext].accountModel = nil;
            NSString * languageCode = [[AppContext sharedAppContext] getCurrentAccountSpaceInfo:kCurrentLanguageCode];
            if (!languageCode) {
                languageCode = [LLanguage getOSDefaultLanguage];
            }
            [AppContext sharedAppContext].languageCode = languageCode;
            //TODO，继续其他操作
        } else {
            SAccountModel * accountModel = ((SLoginByAccountResponse *)response).accountModel;
            //TODO，不一定只有账户登录
            [AppContext sharedAppContext].loginType = LoginTypeAccount;
            [AppContext sharedAppContext].accountModel = accountModel;
            NSString * languageCode = [[AppContext sharedAppContext] getCurrentAccountSpaceInfo:kCurrentLanguageCode];
            if (!languageCode) {
                languageCode = [LLanguage getOSDefaultLanguage];
            }
            [AppContext sharedAppContext].languageCode = languageCode;
            [[AppContext sharedAppContext] updateLoginAccount:accountModel];
            //TODO，继续其他操作
        }
        
        SPostNotification(kNoticeFinishLogin);//完成登录发出通知
        SPostNotification(kNoticeShowVersionCheck);//版本检查通知
    }];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
