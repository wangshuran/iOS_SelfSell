//
//  LTableViewCell.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/4.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LInitProtocol.h"

@interface LTableViewCell : UITableViewCell<LInitProtocol>

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
