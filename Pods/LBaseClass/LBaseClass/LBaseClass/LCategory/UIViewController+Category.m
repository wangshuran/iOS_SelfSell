//
//  UIViewController+Category.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/21.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "UIViewController+Category.h"
#import "LContext.h"

@implementation UIViewController(Category)

#pragma mark - Interface

+ (UIViewController *)getTopController {
    UIViewController * vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
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

+ (void)present:(UIViewController *)vc {
    [UIViewController present:vc animated:YES completion:nil];
}

- (void)present:(UIViewController *)vc {
    [self present:vc animated:YES completion:nil];
}

+ (void)present:(UIViewController *)vc animated:(BOOL)animated completion:(void (^)(void))completion {
    [[UIViewController getTopController] present:vc animated:YES completion:completion];
}

- (void)present:(UIViewController *)vc animated:(BOOL)animated completion:(void (^ )(void))completion {
    [[UIViewController getTopController] present:vc animated:YES completion:completion];
}

- (void)push:(UIViewController *)vc {
    [self push:vc animated:YES];
}

- (void)push:(UIViewController *)vc animated:(BOOL)animated {
    if (self.navigationController) {
        [self.navigationController pushViewController:vc animated:animated];
    }
}

- (void)pop {
    [self pop:YES];
}

- (void)pop:(BOOL)animated {
    if (self.navigationController && self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:animated];
    }else {
        [self dismissViewControllerAnimated:animated completion:nil];
    }
}

@end
