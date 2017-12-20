//
//  SViewController.m
//  SelfSell
//
//  Created by liqiang on 2017/12/18.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SViewController.h"


#define kWRNavBarBarTintColorKey @"kWRNavBarBarTintColorKey"

@interface SViewController ()

@end

@implementation SViewController

#pragma mark - Interface

- (void)initialize {
    [super initialize];
    
    self.navigationItem.backBarButtonItem.title = @"";
}

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

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    self.navigationItem.backBarButtonItem.title = @"";
//    if (self.navigationController) {
//        self.navigationController.navigationItem.leftBarButtonItem.title = @"";
        //self.navigationController.navigationItem.backBarButtonItem.title = @"";
//    }
}

@end
