//
//  SSendMailRequest.h
//  SelfSell
//
//  Created by liqiang on 2018/1/22.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SRequest.h"
#import "SSendMailResponse.h"

@interface SSendMailRequest : SRequest

@property (nonatomic, copy) NSString * email;

//REGISTER
//RESETPWD
@property (nonatomic, copy) NSString * type;

@end
