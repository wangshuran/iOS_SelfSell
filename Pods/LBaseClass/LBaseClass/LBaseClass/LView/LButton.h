//
//  LButton.h
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 leeqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LInitProtocol.h"

@class LButton;

/**
 按钮点击事件
 */
typedef void(^LButtonClick)(LButton *);

@interface LButton : UIButton<LInitProtocol>

/**
 唯一标示
 */
@property (nonatomic, strong) NSString *uid;

/**
 创建时间
 */
@property (nonatomic, assign, readonly) NSTimeInterval createTime;

/**
 销毁时间
 */
@property (nonatomic, assign, readonly) NSTimeInterval destroyTime;

/**
 设置按钮点击事件
 */
@property (nonatomic, assign) LButtonClick clickBlock;

@end
