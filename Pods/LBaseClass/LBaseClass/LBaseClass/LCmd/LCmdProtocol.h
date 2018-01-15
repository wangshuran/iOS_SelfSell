
//
//  LCmdProtocol.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/9.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import <ReactiveObjC/ReactiveObjC.h>
#import "LCmdTransfer.h"



//DEMO
//LSettingService * service = [[LSettingService alloc] init];
//[service subscribeNext:LCmdGetAll nextBlock:^(LCmdTransfer * x) {
//    
//}];
//[service execute:[LCmdTransfer cmd:LCmdGetAll value:nil]];

//子类实现该路由方法
//- (RACDisposable *)cmdHandle:(LCmdTransfer *)transfer subscriber:(id<RACSubscriber>)subscriber;



@protocol LCmdProtocol <NSObject>

/**
 命令信号
 */
@property (nonatomic, strong) RACCommand * command;

/**
 订阅信号
 */
@property (nonatomic, strong) RACSubject * subject;


@optional

/**
 订阅具体类型的命令，建议使用该方法订阅命令，使代码更清晰
 */
- (RACDisposable *)subscribeNext:(LCmd *)cmd nextBlock:(void (^)(LCmdTransfer * transfer))nextBlock;

/**
 执行具体类型的命令，建议使用该方法执行命令，使代码更清晰
 */
- (RACSignal *)execute:(LCmdTransfer *)transfer;

/**
 命令处理中心，外部不调用，子类处理
 */
- (RACDisposable *)cmdHandle:(LCmdTransfer *)transfer subscriber:(id<RACSubscriber>)subscriber;

@end
