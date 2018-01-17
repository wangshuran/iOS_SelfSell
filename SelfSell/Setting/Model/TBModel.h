//
//  TBModel.h
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import <LBaseClass/LBaseClass.h>

@interface TBModel : LModel

/**
 标题
 */
@property (nonatomic, copy) NSString * title;

/**
 标题值
 */
@property (nonatomic, copy) NSString * value;

/**
 代码值
 */
@property (nonatomic, copy) NSString * code;

@end
