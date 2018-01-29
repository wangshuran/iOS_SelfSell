//
//  SFundAddPlanResponse.m
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SFundAddPlanResponse.h"

@implementation SFundAddPlanResponse

- (BOOL)reflect:(NSDictionary *)obj {
    [super reflect:obj];
    NSArray * data = [obj objectForKey:@"data"];
    if (data && ![data isEqual:[NSNull null]]) {
        NSMutableArray * models = [[NSMutableArray alloc] initWithCapacity:data.count];
        for (NSDictionary * plan in data) {
            if (plan && ![plan isEqual:[NSNull null]]) {
                SFundAddPlanModel * model = [[SFundAddPlanModel alloc] init];
                [model reflect:plan];
                [models addObject:model];
            }
        }
        self.plans = models.count > 0 ? models : nil;;
    }
    return YES;
}

@end
