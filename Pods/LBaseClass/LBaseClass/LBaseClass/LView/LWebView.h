//
//  LWebView.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/16.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "LInitProtocol.h"

@interface LWebView : WKWebView

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
