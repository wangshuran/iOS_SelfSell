//
//  SVersionService.m
//  SelfSell
//
//  Created by liqiang on 2017/12/22.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SVersionService.h"

@implementation SVersionService

#pragma mark - Interface
    
- (SVersionModel *)getVersionModel {
    SVersionModel * model = [SVersionModel new];
    model.minAppVersion = @"3.2.1";
    model = [SVersionModel new];
    return model;
}
    
@end
