//
//  SFundAddPlanResponse.h
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SResponse.h"
#import "SFundAddPlanModel.h"

@interface SFundAddPlanResponse : SResponse

@property (nonatomic, strong) NSArray<SFundAddPlanModel *> * plans;

@end
