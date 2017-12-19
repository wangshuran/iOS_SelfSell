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

//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    
//    
//    if (self.navigationController) {
//        
//    
//    self.navigationController.navigationBar.tintColor = [UIColor redColor];
//    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
//    
//    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
//        
//        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
//        
//    }
//}

@end
