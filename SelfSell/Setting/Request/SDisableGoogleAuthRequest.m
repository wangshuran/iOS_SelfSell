//
//  SDisableGoogleAuthRequest.m
//  SelfSell
//
//  Created by liqiang on 2018/1/24.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SDisableGoogleAuthRequest.h"

@implementation SDisableGoogleAuthRequest

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.method = HttpMethodPost;
    self.url = [[AppContext sharedAppContext].host stringByAppendingString:@"/investor/disable/googleauth"];
    self.responseClass = SDisableGoogleAuthResponse.class;
}

@end
