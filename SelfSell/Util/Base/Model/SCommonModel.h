//
//  SCommonModel.h
//  SelfSell
//
//  Created by liqiang on 2018/1/11.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SModel.h"

@interface SCommonModel : SModel

/**
 键
 */
@property (nonatomic, strong) id key;

/**
 值
 */
@property (nonatomic, strong) id value;

@property (nonatomic, strong) NSArray * data;

@end
