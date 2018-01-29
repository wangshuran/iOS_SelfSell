//
//  SettingTableView.m
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SettingTableView.h"

@implementation SettingTableView

#pragma mark - Interface

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    [self registerClass:SettingExitCell.class forCellReuseIdentifier:NSStringFromClass(TBExitModel.class)];

    return self;
}

@end
