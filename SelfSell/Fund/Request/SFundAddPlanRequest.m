//
//  SFundAddPlanRequest.m
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SFundAddPlanRequest.h"

@implementation SFundAddPlanRequest

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.method = HttpMethodPost;
    self.url = [[AppContext sharedAppContext].host stringByAppendingString:@"/fund/plan"];
    self.responseClass = SFundAddPlanResponse.class;
}

@end
