//
//  LTableViewController.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LTableViewController.h"
#import "LDefine.h"
#import <objc/runtime.h>

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

//- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//
//    [self initialize];
//
//    return self;
//}
//
//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//
//    [self initialize];
//
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.navigationController && self.hiddenNavbar != self.navigationController.navigationBar.hidden) {
        self.navigationController.navigationBar.hidden = self.hiddenNavbar;
    }
    
    if (self.tabBarController && self.hiddenTabar != self.tabBarController.tabBar.hidden) {
        self.tabBarController.tabBar.hidden = self.hiddenTabar;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
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

- (NSString *)description {
    return [NSString stringWithFormat:@"uid:%@__createTime:%f", self.uid, self.createTime];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    debugDescription();
}

#pragma mark - LInitProtocol

- (void)initialize {
    if (self.uid) {
        @throw [NSException exceptionWithName:[NSString stringWithFormat:@"repeat execute %@", NSStringFromSelector(_cmd)] reason:[NSString stringWithFormat:@"repeat execute %@", NSStringFromSelector(_cmd)] userInfo:nil];
    }
    
    self.hiddenNavbar = NO;
    self.hiddenTabar = YES;
    
    _uid = [NSUUID UUID].UUIDString;
    _createTime = [[NSDate date] timeIntervalSince1970];
}

#pragma mark - LReflectProtocol

- (NSMutableDictionary *)propertyKeyValues:(BOOL)isIncludeParent {
    NSMutableSet * keys = [self propertyKeys:isIncludeParent];
    NSMutableDictionary * keyValues = [[NSMutableDictionary alloc] initWithCapacity:keys.count];
    
    for (NSString * key in keys) {
        id value = [self valueForKey:key];
        if ([value isEqual:[NSNull null]] || value == nil) {
            continue;
        }
        
        [keyValues setObject:value forKey:key];
    }
    
    return keyValues.count == 0 ? nil : keyValues;
}

- (NSMutableSet *)propertyKeys:(BOOL)isIncludeParent {
    return [[self class] propertyKeys:isIncludeParent];
}

+ (NSMutableSet *)propertyKeys:(BOOL)isIncludeParent {
    NSMutableSet * keys = [[NSMutableSet alloc] init];
    Class aClass = self;
    
    while (YES) {
        unsigned int outCount, i;
        objc_property_t * properties = class_copyPropertyList(aClass, &outCount);
        
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            NSString * propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            [keys addObject:propertyName];
        }
        
        free(properties);
        
        if (!isIncludeParent || aClass == nil || aClass == [UITableViewController class]) {
            break;
        }
        
        aClass = [aClass superclass];
    }
    
    return keys.count == 0 ? nil : keys;
}

- (BOOL)reflect:(NSObject *)obj {
    return NO;
}

@end
