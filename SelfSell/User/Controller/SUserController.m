//
//  SUserController.m
//  SelfSell
//
//  Created by liqiang on 2017/12/19.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SUserController.h"

@interface SUserController ()

@end

@implementation SUserController

#pragma mark - Interface

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{        
        SPostNotification(kNoticeToLogin);
    });
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.title = self.className;
}

@end
