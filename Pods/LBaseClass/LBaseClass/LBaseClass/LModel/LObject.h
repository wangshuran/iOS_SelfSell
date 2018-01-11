//
//  LObject.h
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LInitProtocol.h"
#import "LReflectProtocol.h"
#import "LSerializableProtocol.h"

@interface LObject : NSObject<LInitProtocol, LReflectProtocol, LSerializableProtocol>

/**
 唯一标示
 */
@property (nonatomic, copy) NSString * uid;

/**
 创建时间
 */
@property (nonatomic, assign) NSTimeInterval createTime;

@end
