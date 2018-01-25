//
//  SFundController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/12.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SFundController.h"

@interface SFundController ()

@end

@implementation SFundController

#pragma mark - Interface

- (NSString *)title {
    return SLocal(@"fund_title");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (![[AppContext sharedAppContext].accountModel isLoginUser]) {
        SPostNotification(kNoticeToLogin);
    }
}

@end
