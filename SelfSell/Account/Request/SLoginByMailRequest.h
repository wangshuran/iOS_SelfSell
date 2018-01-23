//
//  SLoginByMailRequest.h
//  SelfSell
//
//  Created by liqiang on 2018/1/23.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SRequest.h"
#import "SLoginByMailResponse.h"

@interface SLoginByMailRequest : SRequest

@property (nonatomic, copy) NSString * email;

@property (nonatomic, copy) NSString * password;

@property (nonatomic, copy) NSString * googleAuthCode;

@end
