//
//  LViewController.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LViewController.h"
#import <objc/runtime.h>

@interface LViewController ()

/**
 进入页面时间
 */
@property (nonatomic, assign) NSTimeInterval enterTime;

@end

@implementation LViewController

#pragma mark - Interface

- (instancetype)init {
    self = [super init];
    
    [self initialize];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    [self initialize];
    
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    [self initialize];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.enterTime = [[NSDate date] timeIntervalSince1970];
    
    if (self.visibleNavbar) {
        if (self.navigationController && self.navigationController.navigationBar.hidden) {
            self.navigationController.navigationBar.hidden = NO;
        }
    } else {
        if (self.navigationController && !self.navigationController.navigationBar.hidden) {
            self.navigationController.navigationBar.hidden = YES;
        }
    }
    
    if (self.visibleTabar) {
        if (self.tabBarController && self.tabBarController.tabBar.hidden) {
            self.tabBarController.tabBar.hidden = NO;
        }
    } else {
        if (self.tabBarController && !self.tabBarController.tabBar.hidden) {
            self.tabBarController.tabBar.hidden = YES;
        }
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    _stayTime += ([[NSDate date] timeIntervalSince1970] - self.enterTime);
    self.enterTime = 0;
}

- (NSString *)className {
    return NSStringFromClass([self class]);
}

- (NSDictionary *)statisticsInfo {
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    NSMutableDictionary *statisticsInfo = [[NSMutableDictionary alloc] initWithCapacity:outCount];
    
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        id value = [self valueForKey:propertyName];
        if (![value isEqual:[NSNull null]] && value != nil) {
            [statisticsInfo setObject:value forKey:propertyName];
        }
    }
    
    free(properties);
    
    return statisticsInfo;
}

- (void)setVisibleNavbar:(BOOL)visibleNavbar {
    _visibleNavbar = visibleNavbar;
    
    if (_visibleNavbar) {
        if (self.navigationController && self.navigationController.navigationBar.hidden) {
            self.navigationController.navigationBar.hidden = NO;
        }
    } else {
        if (self.navigationController && !self.navigationController.navigationBar.hidden) {
            self.navigationController.navigationBar.hidden = YES;
        }
    }
}

- (void)setVisibleTabar:(BOOL)visibleTabar {
    _visibleTabar = visibleTabar;
    
    if (_visibleTabar) {
        if (self.tabBarController && self.tabBarController.tabBar.hidden) {
            self.tabBarController.tabBar.hidden = NO;
        }
    } else {
        if (self.tabBarController && !self.tabBarController.tabBar.hidden) {
            self.tabBarController.tabBar.hidden = YES;
        }
    }
}

- (void)dealloc {
    _destroyTime = [[NSDate date] timeIntervalSince1970];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - LInitProtocol

- (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        self.visibleNavbar = NO;
        self.visibleTabar = NO;
        
        self.uid = [NSUUID UUID].UUIDString;
        _createTime = [[NSDate date] timeIntervalSince1970];
        _destroyTime = 0;
        self.enterTime = 0;
        _stayTime = 0;
    });
}

@end
