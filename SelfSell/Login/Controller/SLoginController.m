//
//  SLoginController.m
//  SelfSell
//
//  Created by liqiang on 2017/12/19.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SLoginController.h"

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
    
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.title = self.className;
}

@end
