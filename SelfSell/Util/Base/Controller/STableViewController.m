//
//  STableViewController.m
//  SelfSell
//
//  Created by liqiang on 2017/12/18.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "STableViewController.h"

@interface STableViewController ()

@end

@implementation STableViewController

#pragma mark - Interface

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

#pragma mark - LReflectProtocol

- (BOOL)reflect:(NSDictionary *)obj {
    [self mj_setKeyValues:obj];
    return YES;
}

@end
