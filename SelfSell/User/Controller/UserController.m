//
//  UserController.m
//  SelfSell
//
//  Created by liqiang on 2017/12/19.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "UserController.h"

@interface UserController ()

@end

@implementation UserController

#pragma mark - Interface

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setNavbarBackgroundColor:[UIColor randomColor]];
    [self setNavbarTitleColor:[UIColor randomColor]];
    [self setNavbarBackColor:[UIColor randomColor]];
}

@end
