//
//  SRegisterByMailRequest.h
//  SelfSell
//
//  Created by liqiang on 2018/1/22.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SRequest.h"
#import "SRegisterByMailResponse.h"

@interface SRegisterByMailRequest : SRequest

@property (nonatomic, copy) NSString * email;

@property (nonatomic, copy) NSString * emailCheckCode;

@property (nonatomic, copy) NSString * password;

@property (nonatomic, copy) NSString * inviteCode;

@end
