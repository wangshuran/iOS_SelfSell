//
//  SSettingController.m
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SSettingController.h"

@interface SSettingController ()

@property (nonatomic, strong) LTextField * test1;

@end

@implementation SSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.test1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (LTextField *)test1 {
    if (!_test1) {
        _test1 = [[LTextField alloc] initWithFrame:CGRectMake(10.0f, 100.0f, 200.0f, 50.0f)];
        _test1.backgroundColor = [UIColor randomColor];
        [_test1.rac_textSignal subscribeNext:^(id x) {
            NSLog(@"%@", x);
        }];
        
        
    }
    
    return _test1;
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.title = [self className];
}

@end
