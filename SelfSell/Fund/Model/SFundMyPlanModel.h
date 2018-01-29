//
//  SFundMyPlanModel.h
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBModel.h"

@interface SFundMyPlanModel : TBModel

@property (nonatomic, copy) NSString * planId;

@property (nonatomic, copy) NSString * planTitle;

@property (nonatomic, copy) NSString * planIconUrl;

@property (nonatomic, copy) NSString * amount;

@property (nonatomic, copy) NSString * interest;

@property (nonatomic, copy) NSString * id;

@property (nonatomic, copy) NSString * createTime;

@property (nonatomic, copy) NSString * finishTime;

@end
