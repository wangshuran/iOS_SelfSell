//
//  SUpdatePwdRequest.m
//  SelfSell
//
//  Created by liqiang on 2018/1/24.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SUpdatePwdRequest.h"

@implementation SUpdatePwdRequest

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.method = HttpMethodPost;
    self.url = [[AppContext sharedAppContext].host stringByAppendingString:@"/investor/modify/password"];
    self.responseClass = SUpdatePwdResponse.class;    
    self.id = [AppContext sharedAppContext].accountModel.id;
}


@end
