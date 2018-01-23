//
//  SLoginByMailResponse.h
//  SelfSell
//
//  Created by liqiang on 2018/1/23.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SResponse.h"
#import "SAccountModel.h"

@interface SLoginByMailResponse : SResponse

@property (nonatomic, strong) SAccountModel * data;

@end
