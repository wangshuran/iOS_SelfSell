//
//  SFundBalanceRequest.m
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SFundBalanceRequest.h"

@implementation SFundBalanceRequest


#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.method = HttpMethodPost;
    self.url = [[AppContext sharedAppContext].host stringByAppendingString:@"/fund/info"];
    self.responseClass = SFundBalanceResponse.class;
    self.id = [AppContext sharedAppContext].accountModel.id;
}

@end
