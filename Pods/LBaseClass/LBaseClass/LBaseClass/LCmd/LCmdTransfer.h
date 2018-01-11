//
//  LCmdTransfer.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/8.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LObject.h"


typedef NSString LCmd _NS_TYPED_EXTENSIBLE_ENUM;//命令类型


@interface LCmdTransfer : LObject

+ (instancetype)cmd:(LCmd *)cmd value:(id)value;

- (instancetype)initWithCmd:(LCmd *)cmd value:(id)value;

/**
 命令类型
 */
@property (nonatomic, copy) LCmd * cmd;

/**
 命令内容
 */
@property (nonatomic, strong) id value;

@end
