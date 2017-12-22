//
//  SCheckVersionController.m
//  SelfSell
//
//  Created by liqiang on 2017/12/22.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SCheckVersionController.h"
#import "SVersionService.h"

@interface SCheckVersionController ()

@end

@implementation SCheckVersionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[SVersionService new] getVersionModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
