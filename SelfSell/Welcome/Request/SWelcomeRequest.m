//
//  SWelcomeRequest.m
//  SelfSell
//
//  Created by liqiang on 2018/1/25.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SWelcomeRequest.h"

@implementation SWelcomeRequest

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.method = HttpMethodPost;
    self.url = [[AppContext sharedAppContext].host stringByAppendingString:@"/app/banner"];
    self.responseClass = SWelcomeResponse.class;
}


@end
