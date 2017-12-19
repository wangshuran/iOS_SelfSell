//
//  LoginController.m
//  SelfSell
//
//  Created by liqiang on 2017/12/19.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()

@end

@implementation LoginController

#pragma mark - Interface

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setNavbarBackgroundColor:[UIColor randomColor]];
    [self setNavbarTitleColor:[UIColor randomColor]];
    [self setNavbarBackColor:[UIColor randomColor]];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        SViewController * v2 = [[NSClassFromString(@"UserController") alloc] init];
        v2.title = @"dsds2";
        
        [self.navigationController pushViewController:v2 animated:YES];
    });
}

@end
