//
//  SFundBalanceResponse.h
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SResponse.h"
#import "SFundBalanceModel.h"

@interface SFundBalanceResponse : SResponse

@property (nonatomic, strong) SFundBalanceModel * balanceModel;

@end
