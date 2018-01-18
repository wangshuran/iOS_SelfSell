//
//  SWelcomeController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/12.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SWelcomeController.h"
#import "SDao+Category.h"
#import "SCommonModel+WCTTableCoding.h"

#define kLastWelcomeVersion @"kLastWelcomeVersion"

@interface SWelcomeController ()

@property (nonatomic, strong) SScrollView * scrollView;

@end

@implementation SWelcomeController

- (instancetype)init {
    SCommonModel * model = (SCommonModel *)[[AppContext sharedAppContext].commonDao getObjectFromTable:[[SCommonModel alloc] init] condition:SCommonModel.key == kLastWelcomeVersion];
    if (model && [model.value isEqualToString:[LAppInfo CFBundleShortVersionString]]) {
        return nil;
    }
    
    if (model) {
        model.value = [LAppInfo CFBundleShortVersionString];
        [[AppContext sharedAppContext].commonDao updateObject:model property:SCommonModel.value];
    }else {
        model = [[SCommonModel alloc] init];
        model.key = kLastWelcomeVersion;
        model.value = [LAppInfo CFBundleShortVersionString];
        [[AppContext sharedAppContext].commonDao insertObject:model];
    }
    
    self = [super init];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
