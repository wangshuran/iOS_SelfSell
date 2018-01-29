//
//  SEnableGoogleAuthRequest.m
//  SelfSell
//
//  Created by liqiang on 2018/1/24.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SEnableGoogleAuthRequest.h"

@implementation SEnableGoogleAuthRequest

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.method = HttpMethodPost;
    self.url = [[AppContext sharedAppContext].host stringByAppendingString:@"/investor/enable/googleauth"];
    self.responseClass = SEnableGoogleAuthResponse.class;    
    self.id = [AppContext sharedAppContext].accountModel.id;
}

@end


