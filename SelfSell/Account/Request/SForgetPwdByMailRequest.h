//
//  SForgetPwdByMailRequest.h
//  SelfSell
//
//  Created by liqiang on 2018/1/24.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SRequest.h"
#import "SForgetPwdByMailResponse.h"

@interface SForgetPwdByMailRequest : SRequest

@property (nonatomic, copy) NSString * email;

@property (nonatomic, copy) NSString * emailCheckCode;

@property (nonatomic, copy) NSString * password;

@end
