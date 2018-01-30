//
//  STurnOutController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/30.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "STurnOutController.h"

@implementation STurnOutController

// = "转出";
//turnout_dizhi = "地址";
//turnout_shurudizhi = "输入地址";
//turnout_shuliang = "数量";
//turnout_shurushuliang = "输入数量";
//turnout_shouxufei = "手续费";
//turnout_shurushouxufei = "输入手续费";
//turnout_zhuanchu = "转出";

#pragma mark - Interface

- (NSString *)title {
    return SLocal(@"turnout_title");
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
}

@end
