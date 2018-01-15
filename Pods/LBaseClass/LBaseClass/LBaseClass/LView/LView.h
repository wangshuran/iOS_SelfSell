//
//  LView.h
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 leeqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LInitProtocol.h"

@interface LView : UIView<LInitProtocol>

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
