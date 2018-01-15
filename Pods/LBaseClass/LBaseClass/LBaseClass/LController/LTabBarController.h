//
//  LTabBarController.h
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LInitProtocol.h"
#import "LReflectProtocol.h"

@interface LTabBarController : UITabBarController<LInitProtocol, LReflectProtocol>

/**
 唯一标识
 */
@property (nonatomic, copy) NSString * uid;

/**
 创建时间
 */
@property (nonatomic, assign) NSTimeInterval createTime;

@end
