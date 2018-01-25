//
//  SRewardResponse.h
//  SelfSell
//
//  Created by liqiang on 2018/1/25.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SResponse.h"
#import "SRewardRankingModel.h"

@interface SRewardResponse : SResponse

@property (nonatomic, copy) NSString * inviteCode;

@property (nonatomic, copy) NSString * inviteNum;

@property (nonatomic, copy) NSString * reward;

@property (nonatomic, strong) NSArray<SRewardRankingModel *> * rewardRankList;

@end
