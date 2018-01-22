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
//typedef void(^LButtonClick)(LButton *);

@interface LButton : UIButton<LInitProtocol>

/**
 弧度为5的圆角按钮
 */
+ (instancetype)btnCorner_5;

/**
 唯一标示
 */
@property (nonatomic, copy) NSString * uid;

/**
 创建时间
 */
@property (nonatomic, assign) NSTimeInterval createTime;

/**
 布局UI
 */
- (void)layoutUI;

@end
