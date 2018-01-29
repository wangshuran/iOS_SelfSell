//
//  SFundSectionModel.h
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBSectionModel.h"
#import "SFundBalanceModel.h"
#import "SFundMyPlanModel.h"
//未在计划
#import "SFundAddPlansModel.h"
#import "SFundTradeTitleModel.h"
#import "SFundTradeDetailModel.h"

@interface SFundSectionModel : TBSectionModel

@property (nonatomic, strong) SFundBalanceModel * balanceModel;

@property (nonatomic, strong) NSArray<SFundMyPlanModel *> * myPlanModels;

@property (nonatomic, strong) SFundAddPlansModel * addPlansModel;

@property (nonatomic, strong) SFundTradeTitleModel * tradeTitleModel;

@property (nonatomic, strong) SFundTradeDetailModel * tradeDetailModel;

- (void)reloadData;

@end
