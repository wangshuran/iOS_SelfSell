//
//  SRewardResponse.m
//  SelfSell
//
//  Created by liqiang on 2018/1/25.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SRewardResponse.h"

@implementation SRewardResponse

- (BOOL)reflect:(NSDictionary *)obj {
    [super reflect:obj];
    NSDictionary * data = [obj objectForKey:@"data"];
    if (data) {
        NSArray * rewardRankList = [data objectForKey:@"rewardRankList"];
        NSMutableArray * models = [[NSMutableArray alloc] initWithCapacity:rewardRankList.count];
        if (rewardRankList) {
            for (NSDictionary * rewardRank in rewardRankList) {
                SRewardRankingModel * model = [[SRewardRankingModel alloc] init];
                [model reflect:rewardRank];
                [models addObject:model];
            }
        }
        self.rewardRankList = models;
    }
    return YES;
}

@end
