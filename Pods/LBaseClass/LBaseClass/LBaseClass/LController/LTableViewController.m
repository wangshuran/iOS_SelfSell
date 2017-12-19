//
//  LTableViewController.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LTableViewController.h"
#import <objc/runtime.h>

@interface LTableViewController ()

/**
 进入页面时间
 */
@property (nonatomic, assign) NSTimeInterval enterTime;

@end

@implementation LTableViewController

#pragma mark - Interface

- (instancetype)init {
    self = [super init];
    
    [self initialize];
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    
    [self initialize];
    
    return self;
}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    [self initialize];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
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
    
    if (self.navigationController && self.hiddenNavbar != self.navigationController.navigationBar.hidden) {
        self.navigationController.navigationBar.hidden = self.hiddenNavbar;
    }
    
    if (self.tabBarController && self.hiddenTabar != self.tabBarController.tabBar.hidden) {
        self.tabBarController.tabBar.hidden = self.hiddenTabar;
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

- (void)setHiddenNavbar:(BOOL)hiddenNavbar {
    _hiddenNavbar = hiddenNavbar;
    
    if (self.navigationController && hiddenNavbar != self.navigationController.navigationBar.hidden) {
        self.navigationController.navigationBar.hidden = hiddenNavbar;
    }
}

- (void)setHiddenTabar:(BOOL)hiddenTabar {
    _hiddenTabar = hiddenTabar;
    
    if (self.tabBarController && hiddenTabar != self.tabBarController.tabBar.hidden) {
        self.tabBarController.tabBar.hidden = hiddenTabar;
    }
}

- (void)dealloc {    
    _destroyTime = [[NSDate date] timeIntervalSince1970];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - LInitProtocol

- (void)initialize {
    self.hiddenNavbar = NO;
    self.hiddenTabar = YES;
    
    self.uid = [NSUUID UUID].UUIDString;
    _createTime = [[NSDate date] timeIntervalSince1970];
    _destroyTime = 0;
    self.enterTime = 0;
    _stayTime = 0;
}

@end
