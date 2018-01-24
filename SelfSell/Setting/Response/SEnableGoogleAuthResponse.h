//
//  SEnableGoogleAuthResponse.h
//  SelfSell
//
//  Created by liqiang on 2018/1/24.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SResponse.h"

@interface SEnableGoogleAuthResponse : SResponse

@property (nonatomic, copy) NSString * googleAuthKey;

@property (nonatomic, copy) NSString * googleAuthQrcode;

@end
