//
//  SFundBalanceResponse.m
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SFundBalanceResponse.h"

@implementation SFundBalanceResponse

- (BOOL)reflect:(NSDictionary *)obj {
    [super reflect:obj];
    SFundBalanceModel * model = [[SFundBalanceModel alloc] init];
    [model reflect:obj];
    NSDictionary * data = [obj objectForKey:@"data"];
    if (data && ![data isEqual:[NSNull null]]) {
        NSArray * fundDetail = [data objectForKey:@"fundDetail"];
        if (fundDetail && ![fundDetail isEqual:[NSNull null]]) {
            NSMutableArray * models = [[NSMutableArray alloc] initWithCapacity:fundDetail.count];
            for (NSDictionary * fund in fundDetail) {
                if (fund && ![fund isEqual:[NSNull null]]) {
                    SFundMyPlanModel * model = [[SFundMyPlanModel alloc] init];
                    [model reflect:fund];
                    [models addObject:model];
                }
            }
            model.fundDetail = models.count > 0 ? models : nil;;
        }
    }
    self.balanceModel = model;
    
    return YES;
}

@end
