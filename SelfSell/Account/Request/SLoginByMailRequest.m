//
//  SLoginByMailRequest.m
//  SelfSell
//
//  Created by liqiang on 2018/1/23.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SLoginByMailRequest.h"

@implementation SLoginByMailRequest

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.method = HttpMethodPost;
    self.url = [[AppContext sharedAppContext].host stringByAppendingString:@"/investor/login"];
    self.responseClass = SLoginByMailResponse.class;
}

@end
