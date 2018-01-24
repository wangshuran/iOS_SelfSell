//
//  SForgetPwdByMailRequest.m
//  SelfSell
//
//  Created by liqiang on 2018/1/24.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SForgetPwdByMailRequest.h"

@implementation SForgetPwdByMailRequest

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.method = HttpMethodPost;
    self.url = [[AppContext sharedAppContext].host stringByAppendingString:@"/investor/reset/password"];
    self.responseClass = SForgetPwdByMailResponse.class;
}

@end
