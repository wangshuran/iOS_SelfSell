//
//  SFundBalanceResponse.h
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SResponse.h"
#import "SFundPlanModel.h"

@interface SFundBalanceResponse : SResponse

@property (nonatomic, copy) NSString * totalSSC;

@property (nonatomic, copy) NSString * totalPrice;

@property (nonatomic, copy) NSString * availableSSC;

@property (nonatomic, strong) NSArray<SFundPlanModel *> * fundDetail;

@end
