//
//  LTextField.h
//  LBaseClass
//
//  Created by liqiang on 2017/11/30.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LInitProtocol.h"

@interface LTextField : UITextField<LInitProtocol>

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

/**
 设置默认文本字体
 */
- (void)setPlaceholderFont:(UIFont *)font;

/**
 设置默认文本颜色
 */
- (void)setPlaceholderColor:(UIColor *)color;

/**
 设置默认文本对齐方式
 */
- (void)setPlaceholderAligment:(NSTextAlignment)alignment;

@end
