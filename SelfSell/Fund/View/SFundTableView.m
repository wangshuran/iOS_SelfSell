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
    [self registerClass:SFundBalanceCell.class forCellReuseIdentifier:NSStringFromClass(FundBalanceModel.class)];
    [self registerClass:SFundPlanCell.class forCellReuseIdentifier:NSStringFromClass(FundPlanModel.class)];
    [self registerClass:SFundAddPlanCell.class forCellReuseIdentifier:NSStringFromClass(FundAddPlanModel.class)];
    [self registerClass:SFundTradeDetailCell.class forCellReuseIdentifier:NSStringFromClass(FundTradeDetailModel.class)];
    [self registerClass:SFundTradeTitleCell.class forCellReuseIdentifier:NSStringFromClass(FundTradeTitleModel.class)];
    
    return self;
}

@end
