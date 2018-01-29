//
//  SettingTableView.m
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SettingTableView.h"

@implementation SettingTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    [self registerClass:THeaderView.class forHeaderFooterViewReuseIdentifier:NSStringFromClass(TBSectionModel.class)];
    [self registerClass:TBArrowCell.class forCellReuseIdentifier:NSStringFromClass(TBArrowModel.class)];
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBModel.class)];
    [self registerClass:TBCheckCell.class forCellReuseIdentifier:NSStringFromClass(TBCheckModel.class)];
    [self registerClass:TBExitCell.class forCellReuseIdentifier:NSStringFromClass(TBExitModel.class)];
    [self registerClass:TBSwitchCell.class forCellReuseIdentifier:NSStringFromClass(TBSwitchModel.class)];
    [self registerClass:TBTextCell.class forCellReuseIdentifier:NSStringFromClass(TBTextModel.class)];
    
    return self;
}

@end
