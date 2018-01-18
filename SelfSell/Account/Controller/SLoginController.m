//
//  SLoginController.m
//  SelfSell
//
//  Created by liqiang on 2017/12/19.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SLoginController.h"
#import "STouchID.h"

@interface SLoginController ()

@end

@implementation SLoginController

#pragma mark - Interface

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setNavbarBackgroundColor:[UIColor randomColor]];
    
    STouchID * touch = [[STouchID alloc] init];
    if ([touch canPolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics]) {
        [touch openTouchIDWithPolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics fallbackTitle:SLocal(@"security_touch_pwdunlock") msg:SLocal(@"security_touch_unlocktitle") touchIDBlock:^(BOOL status, BOOL isFallbackTitle, NSString * msg) {
            if (status) {
                [self dismiss];
            }
        }];
    }else {
        [self dismiss];
    }
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
}

@end
