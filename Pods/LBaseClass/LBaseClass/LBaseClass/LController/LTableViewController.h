//
//  LTableViewController.h
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LInitProtocol.h"
#import "LPropertyProtocol.h"

@interface LTableViewController : UITableViewController<LInitProtocol, LPropertyProtocol>

/**
 唯一标识
 */
@property (nonatomic, copy, readonly) NSString * uid;

/**
 创建时间
 */
@property (nonatomic, assign, readonly) NSTimeInterval createTime;

/**
 销毁时间
 */
@property (nonatomic, assign, readonly) NSTimeInterval destroyTime;

/**
 停留时长
 */
@property (nonatomic, assign, readonly) NSTimeInterval stayTime;

/**
 类名称
 */
@property (nonatomic, copy, readonly) NSString * className;

/**
 是否显示导航控制器
 */
@property (nonatomic, assign) BOOL hiddenNavbar;

/**
 是否显示导航控制器
 */
@property (nonatomic, assign) BOOL hiddenTabar;

@end
