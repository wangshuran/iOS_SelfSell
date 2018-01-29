//
//  SFundAddPlansModel.h
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBModel.h"
#import "SFundAddPlanModel.h"

@interface SFundAddPlansModel : TBModel

@property (nonatomic, strong) NSArray<SFundAddPlanModel *> * plans;

@end
