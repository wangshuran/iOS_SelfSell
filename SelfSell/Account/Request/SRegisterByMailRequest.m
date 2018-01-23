//
//  SRegisterByMailRequest.m
//  SelfSell
//
//  Created by liqiang on 2018/1/22.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SRegisterByMailRequest.h"

@implementation SRegisterByMailRequest

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.method = HttpMethodPost;
    self.url = [[AppContext sharedAppContext].host stringByAppendingString:@"/investor/register"];
    self.responseClass = SRegisterByMailResponse.class;
}

@end
