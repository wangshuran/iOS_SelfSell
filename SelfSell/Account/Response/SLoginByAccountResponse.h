//
//  SLoginByAccountResponse.h
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SResponse.h"
#import "SAccountModel.h"

@interface SLoginByAccountResponse : SResponse

@property (nonatomic, strong) SAccountModel * accountModel;

@end
