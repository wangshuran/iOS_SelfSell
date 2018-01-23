//
//  SSendMailRequest.m
//  SelfSell
//
//  Created by liqiang on 2018/1/22.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SSendMailRequest.h"

@implementation SSendMailRequest

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.method = HttpMethodPost;
    self.url = [[AppContext sharedAppContext].host stringByAppendingString:@"/send/email"];
    self.responseClass = SSendMailResponse.class;
}

@end
