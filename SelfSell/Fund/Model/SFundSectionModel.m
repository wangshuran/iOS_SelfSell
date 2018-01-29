//
//  SFundSectionModel.m
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SFundSectionModel.h"

@implementation SFundSectionModel

#pragma mark - Interface

- (void)reloadData {
    NSMutableArray * items = [[NSMutableArray alloc] init];
    if (self.balanceModel) {
        [items addObject:self.balanceModel];
    }
    if (self.myPlanModels.count > 0) {
        [items addObjectsFromArray:self.myPlanModels];
    }
    if (self.addPlansModel) {
        [items addObject:self.addPlansModel];
    }
    if (self.tradeTitleModel) {
        [items addObject:self.tradeTitleModel];
    }
    if (self.tradeDetailModel) {
        [items addObject:self.tradeDetailModel];
    }
    self.items = items;
}

@end
