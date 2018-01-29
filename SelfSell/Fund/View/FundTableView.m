//
//  FundTableView.m
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "FundTableView.h"

@implementation FundTableView

#pragma mark - Interface

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    [self registerClass:FundBalanceCell.class forCellReuseIdentifier:NSStringFromClass(FundBalanceModel.class)];
    [self registerClass:FundPlanCell.class forCellReuseIdentifier:NSStringFromClass(FundPlanModel.class)];
    [self registerClass:FundAddPlanCell.class forCellReuseIdentifier:NSStringFromClass(FundAddPlanModel.class)];
    [self registerClass:FundTradeDetailCell.class forCellReuseIdentifier:NSStringFromClass(FundTradeDetailModel.class)];
    [self registerClass:FundTradeTitleCell.class forCellReuseIdentifier:NSStringFromClass(FundTradeTitleModel.class)];
    
    return self;
}

@end
