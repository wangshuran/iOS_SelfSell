//
//  SViewController.m
//  SelfSell
//
//  Created by liqiang on 2017/12/18.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SViewController.h"
#import "UINavigationItem+Margin.h"

@interface SViewController ()

@end

@implementation SViewController

#pragma mark - Interface

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if (self.navigationController) {
        UIColor * color = self.navigationController.navigationBar.barTintColor;
        if (color) {
            return [color isDark] ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
        }
    }
    
    return UIStatusBarStyleDefault;
}

- (SView *)vNavLeft {
    if (!_vNavLeft) {
        _vNavLeft = [[SView alloc] init];
        _vNavLeft.backgroundColor = [UIColor randomColor];
        _vNavLeft.frame = CGRectMake(0.0f, 0.0f, 64.0f, 44.0f);
    }
    
    return _vNavLeft;
}

- (SView *)vNavRight {
    if (!_vNavRight) {
        _vNavRight = [[SView alloc] init];
        _vNavRight.backgroundColor = [UIColor clearColor];
        _vNavRight.frame = CGRectMake(0.0f, 0.0f, 64.0f, 44.0f);
    }
    
    return _vNavRight;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (!self.navigationController || self.navigationController.viewControllers.count < 2) {
        self.vNavLeft.hidden = YES;
    }else {
        self.vNavLeft.hidden = NO;
    }
}

- (void)loadView {
    [super loadView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.vNavLeft];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.vNavRight];
    self.navigationItem.leftMargin = 0.0f;
    self.navigationItem.rightMargin = 0.0f;
}

//#pragma mark - LInitProtocol
//
//- (void)initialize {
//    [super initialize];
//}

@end
