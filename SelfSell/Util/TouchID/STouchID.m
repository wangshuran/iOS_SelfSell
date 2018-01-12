//
//  STouchID.m
//  SelfSell
//
//  Created by liqiang on 2018/1/12.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "STouchID.h"

@implementation STouchID

- (BOOL)canPolicy {
    return [self canPolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics];
}

- (BOOL)canPolicy:(LAPolicy)policy {
    LAContext * context = [[LAContext alloc] init];
    
    return [context canEvaluatePolicy:policy error:nil];
}

- (void)openTouchIDWithPolicy:(LAPolicy)policy fallbackTitle:(NSString *)fallbackTitle msg:(NSString *)msg touchIDBlock:(STouchIDOpenBlock)block {
    if (![self canPolicy:policy]) {//未开启
        block(NO, NO, nil);
        
        return;
    }
    
    LAContext * context = [[LAContext alloc] init];
    context.localizedFallbackTitle = fallbackTitle;
    [context evaluatePolicy:policy localizedReason:msg reply:^(BOOL success, NSError * error) {
        if (success && block) {//成功操作
            block(YES, NO, nil);
        } else {//失败操作
            LAError errorCode = error.code;
            BOOL input = NO;
            NSString * message = nil;
            
            switch (errorCode) {
                case LAErrorAuthenticationFailed: {//连续三次指纹识别错误
                    break;
                }
                case LAErrorUserCancel: {//用户取消
                    break;
                }
                case LAErrorUserFallback: {//用户选择输入
                    input = YES;
                    break;
                }
                case LAErrorSystemCancel: {//取消授权，如其他应用切入
                    break;
                }
                case LAErrorPasscodeNotSet: {//设备系统未设置密码
                    break;
                }
                case LAErrorTouchIDNotAvailable: {//此设备不支持 Touch ID
                    break;
                }
                case LAErrorTouchIDNotEnrolled: {//用户未录入指纹
                    break;
                }
                case LAErrorTouchIDLockout: {//Touch ID被锁，需要用户输入密码解锁
                    if ([LSystemInfo higheriOS9]) {
                        [self openTouchIDWithPolicy:LAPolicyDeviceOwnerAuthentication fallbackTitle:fallbackTitle msg:msg touchIDBlock:block];
                    }
                    
                    break;
                }
                case LAErrorAppCancel: {//如突然来了电话，电话应用进入前台，APP被挂起啦
                    break;
                }
                case LAErrorInvalidContext: {//Touch ID 失效
                    break;
                }
                default: {
                    break;
                }
            }
            
            if (block) {
                block(success, input, message);
            }
        }
    }];
}

@end
