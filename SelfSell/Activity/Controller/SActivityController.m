//
//  SActivityController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/12.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SActivityController.h"

@interface SActivityController ()

@end

@implementation SActivityController

#pragma mark - Interface

- (NSString *)title {
    return SLocal(@"activity_title");
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    self.hiddenNavbar = NO;
    self.hiddenTabar = NO;
}

@end
