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
    if (data && ![data isEqual:[NSNull null]]) {
        NSArray * rewardRankList = [data objectForKey:@"rewardRankList"];
        if (rewardRankList && ![rewardRankList isEqual:[NSNull null]]) {
            NSMutableArray * models = [[NSMutableArray alloc] initWithCapacity:rewardRankList.count];
            for (NSDictionary * rewardRank in rewardRankList) {
                if (rewardRank && ![rewardRank isEqual:[NSNull null]]) {
                    SRewardRankingModel * model = [[SRewardRankingModel alloc] init];
                    [model reflect:rewardRank];
                    [models addObject:model];
                }
            }
            self.rewardRankList = models.count > 0 ? models : nil;
        }
    }
    return YES;
}

@end
