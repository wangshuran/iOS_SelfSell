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

- (void)initialize {
    [super initialize];
    
    self.title = self.className;    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        SViewController * vc = [[NSClassFromString(@"UserController") alloc] init];

        [self.navigationController pushViewController:vc animated:YES];
    });
}

@end
