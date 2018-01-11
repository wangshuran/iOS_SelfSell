//
//  LResponse.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/21.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LResponse.h"

@implementation LResponse

#pragma mark - Interface

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.status = NO;
    self.msg = nil;
}

@end
