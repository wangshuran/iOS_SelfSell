//
//  SSettingRequest.m
//  SelfSell
//
//  Created by liqiang on 2017/12/26.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SSettingRequest.h"

@implementation SSettingRequest

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.url = [[AppContext sharedAppContext].host stringByAppendingString:@""];
    self.responseClass = SSettingItemResponse.class;
}

@end
