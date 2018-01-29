//
//  SFundAddPlanModel.h
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBModel.h"

@interface SFundAddPlanModel : TBModel

@property (nonatomic, copy) NSString * id;

@property (nonatomic, copy) NSString * iconUrl;

@property (nonatomic, copy) NSString * annualRate;

@property (nonatomic, copy) NSString * term;

@property (nonatomic, copy) NSString * termUnit;

@property (nonatomic, copy) NSString * title;

@property (nonatomic, copy) NSString * remark;

@end
