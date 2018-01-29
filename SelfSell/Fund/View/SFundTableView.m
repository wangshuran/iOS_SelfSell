//
//  SFundTableView.m
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SFundTableView.h"

@implementation SFundTableView

#pragma mark - Interface

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    [self registerClass:SFundBalanceCell.class forCellReuseIdentifier:NSStringFromClass(SFundBalanceModel.class)];
    [self registerClass:SFundMyPlanCell.class forCellReuseIdentifier:NSStringFromClass(SFundMyPlanModel.class)];
    [self registerClass:SFundAddPlansCell.class forCellReuseIdentifier:NSStringFromClass(SFundAddPlansModel.class)];
    [self registerClass:SFundTradeDetailCell.class forCellReuseIdentifier:NSStringFromClass(SFundTradeDetailModel.class)];
    [self registerClass:SFundTradeTitleCell.class forCellReuseIdentifier:NSStringFromClass(SFundTradeTitleModel.class)];
    
    return self;
}

@end
