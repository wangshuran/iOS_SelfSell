//
//  AppContext+User.m
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "AppContext+User.h"
#import "SLoginController.h"

@implementation AppContext(User)

#pragma mark - Interface

- (NSString *)getCurrentUserPath {
    NSString * libraryPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
    NSString * userIdentifier = self.loginType == LoginTypeNone ? [[UIDevice currentDevice] uniqueDeviceIdentifier] : self.userModel.userid;
    userIdentifier = [userIdentifier MD5];
    NSString * selfsellPath = [libraryPath stringByAppendingPathComponent:userIdentifier];
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    @synchronized(self) {
        if (![fileManager fileExistsAtPath:selfsellPath]) {
            [fileManager createDirectoryAtPath:selfsellPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
    }
    
    return selfsellPath;
}

- (void)updateUserInfo:(id)value key:(NSString *)key {
    if (key.length == 0 || value == nil) {
        return;
    }
    
    NSString * userIdentifier = self.loginType == LoginTypeNone ? [[UIDevice currentDevice] uniqueDeviceIdentifier] : self.userModel.userid;
    userIdentifier = [userIdentifier MD5];
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];

    @synchronized(self) {
        NSMutableDictionary * info = [userDefaults objectForKey:userIdentifier];
        
        if (info) {
            info = [info mutableCopy];
        }else {
            info = [[NSMutableDictionary alloc] init];
        }
        
        [info setObject:value forKey:key];
        [userDefaults setObject:info forKey:userIdentifier];
        [userDefaults synchronize];
    }
}

- (id)getUserInfo:(NSString *)key {
    if (key.length == 0) {
        return nil;
    }
    
    NSString * userIdentifier = self.loginType == LoginTypeNone ? [[UIDevice currentDevice] uniqueDeviceIdentifier] : self.userModel.userid;
    userIdentifier = [userIdentifier MD5];
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    @synchronized(self) {
        NSMutableDictionary * info = [userDefaults objectForKey:userIdentifier];
        
        if (info == nil) {
            return nil;
        }
        
        return [info objectForKey:key];
    }
}

#pragma mark - NSNotification

/**
 去登录通知
 */
- (void)noticeToLogin:(NSNotification *)notification {
    //此处最好加独占锁，防止连续发送两次通知，弹出两个登录视图
    SLoginController * vc = [[SLoginController alloc] init];
    SNavigationController * nav = [[SNavigationController alloc] initWithRootViewController:vc];
    
    [LContext presentViewController:nav];
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
