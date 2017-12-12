//
//  AppContext.m
//  SelfSell
//
//  Created by liqiang on 2017/12/12.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "AppContext.h"

@implementation AppContext

#pragma mark - Interface

- (LTabBarController *)rootVC {
    if (!_rootVC) {
        _rootVC = [[LTabBarController alloc] init];
        _rootVC.viewControllers = [NSArray arrayWithObjects:self.n1VC, nil];
        _rootVC.selectedViewController = self.n1VC;
    }
    
    return _rootVC;
}

- (LNavigationController *)n1VC {
    if (!_n1VC) {
        LViewController *v1 = [[LViewController alloc] init];
        v1.view.backgroundColor = [LColor randomColor];
        
        _n1VC = [[LNavigationController alloc] initWithRootViewController:v1];        
    }
    
    return _n1VC;
}

@end
