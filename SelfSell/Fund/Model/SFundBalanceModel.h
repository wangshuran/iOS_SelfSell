//
//  SFundBalanceModel.h
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBModel.h"
#import "SFundMyPlanModel.h"

@interface SFundBalanceModel : TBModel

@property (nonatomic, copy) NSString * totalSSC;

@property (nonatomic, copy) NSString * totalPrice;

@property (nonatomic, copy) NSString * availableSSC;

@property (nonatomic, strong) NSArray<SFundMyPlanModel *> * fundDetail;

@end
