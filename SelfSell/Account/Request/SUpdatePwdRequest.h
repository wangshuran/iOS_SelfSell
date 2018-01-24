//
//  SUpdatePwdRequest.h
//  SelfSell
//
//  Created by liqiang on 2018/1/24.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SRequest.h"
#import "SUpdatePwdResponse.h"

@interface SUpdatePwdRequest : SRequest

@property (nonatomic, copy) NSString * id;

@property (nonatomic, copy) NSString * password;

@property (nonatomic, copy) NSString * passwordNew;

@end
