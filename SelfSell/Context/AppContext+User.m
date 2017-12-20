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

#pragma mark - NSNotification

/**
 去登录通知
 */
- (void)noticeToLogin:(NSNotification *)notification {
    //此处最好加独占锁，防止连续发送两次通知，弹出两个登录视图
    SLoginController * vc = [[SLoginController alloc] init];
    SNavigationController * nav = [[SNavigationController alloc] initWithRootViewController:vc];
    
    [[AppContext sharedAppContext] presentViewController:nav];
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
