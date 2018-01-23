//
//  STabBarController.m
//  SelfSell
//
//  Created by liqiang on 2017/12/18.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "STabBarController.h"

@interface STabBarController ()

@end

@implementation STabBarController

#pragma mark - Interface

#pragma mark - LReflectProtocol

- (BOOL)reflect:(NSDictionary *)obj {
    [self mj_setKeyValues:obj];
    return YES;
}

@end
