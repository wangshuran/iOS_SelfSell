//
//  SAccountController.m
//  SelfSell
//
//  Created by liqiang on 2017/12/26.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SAccountController.h"

@interface SAccountController ()

@end

@implementation SAccountController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Interface

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //SPostNotification(kNoticeToLogin);
        SPostNotification(kNoticeShowVersionCheck);
    });
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.title = [self className];
}

@end
