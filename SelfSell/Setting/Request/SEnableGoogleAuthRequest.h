//
//  SEnableGoogleAuthRequest.h
//  SelfSell
//
//  Created by liqiang on 2018/1/24.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SRequest.h"
#import "SEnableGoogleAuthResponse.h"

@interface SEnableGoogleAuthRequest : SRequest

@property (nonatomic, copy) NSString * id;

//0、1
@property (nonatomic, copy) NSString * step;

@property (nonatomic, copy) NSString * googleAuthCode;

@end
