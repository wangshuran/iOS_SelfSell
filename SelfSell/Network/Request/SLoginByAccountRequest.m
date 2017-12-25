//
//  SLoginByAccountRequest.m
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SLoginByAccountRequest.h"

@implementation SLoginByAccountRequest


#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.url = [[AppContext sharedAppContext].host stringByAppendingString:@""];    
}

@end
