//
//  LContext.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/30.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LContext.h"

@implementation LContext

#pragma mark - Interface

- (NSString *)getBundleIdentifier {
    return [NSBundle mainBundle].bundleIdentifier;
}

- (NSString *)getCurrentVersionInBundle {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

- (UIViewController *)getTopViewController {
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (YES) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController *)vc).selectedViewController;
        }
        
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *)vc).visibleViewController;
        }
        
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    
    return vc;
}

@end
