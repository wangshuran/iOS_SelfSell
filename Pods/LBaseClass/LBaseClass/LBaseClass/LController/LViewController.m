//
//  LViewController.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LViewController.h"
#import "UIColor+Category.h"
#import "LDefine.h"
#import <objc/runtime.h>

@interface LViewController ()

@end

@implementation LViewController

#pragma mark - Interface

- (instancetype)init {
    self = [super init];
    
    [self initialize];
    
    return self;
}

//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//    
//    [self initialize];
//    
//    return self;
//}
//
//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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
    
    [self setNavbarBackgroundColor:[UIColor whiteColor]];
    [self setNavbarBackColor:[UIColor blackColor]];
    [self setNavbarTitleColor:[UIColor blackColor]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (BOOL)prefersStatusBarHidden {
    return NO;
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

- (void)setNavbarBackgroundColor:(UIColor *)color {
    if (color && self.navigationController) {
        self.navigationController.navigationBar.barTintColor = color;
        
        //自动识别状态栏颜色，根据导航栏背景颜色色系
        self.navigationController.navigationBar.barStyle = [color isDark] ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
    }
}

- (void)setNavbarBackColor:(UIColor *)color {
    if (color && self.navigationController) {
        self.navigationController.navigationBar.tintColor = color;
    }
}

- (void)setNavbarTitleColor:(UIColor *)color {
    if (color && self.navigationController) {
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:color};
    }
}

- (NSString *)description {
    _logRetainCount(self);
    
    return [NSString stringWithFormat:@"class:%@__uid:%@__createTime:%f", self.class, self.uid, self.createTime];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    _logImport();
}

#pragma mark - LInitProtocol

- (void)initialize {
    //static dispatch_once_t onceToken;
    //dispatch_once(&onceToken, ^{
    if (self.uid) {
        @throw [NSException exceptionWithName:[NSString stringWithFormat:@"repeat execute %@", NSStringFromSelector(_cmd)] reason:[NSString stringWithFormat:@"repeat execute %@", NSStringFromSelector(_cmd)] userInfo:nil];
    }
    
    self.uid = [NSUUID UUID].UUIDString;
    self.createTime = [[NSDate date] timeIntervalSince1970];
    self.hiddenNavbar = NO;
    self.hiddenTabar = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    //});
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
    return [self.class propertyKeys:isIncludeParent];
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
        
        if (!isIncludeParent || aClass == nil || aClass == LViewController.class) {
            break;
        }
        
        aClass = aClass.superclass;
    }
    
    return keys.count == 0 ? nil : keys;
}

- (NSMutableSet *)collectionPropertyKeys:(BOOL)isIncludeParent {
    return [self.class collectionPropertyKeys:isIncludeParent];
}

+ (NSMutableSet *)collectionPropertyKeys:(BOOL)isIncludeParent {
    Class aClass = self;
    
    NSMutableSet * propertyKeys = [aClass propertyKeys:isIncludeParent];
    NSMutableSet * keys = [[NSMutableSet alloc] init];
    
    for (NSString * key in propertyKeys) {
        objc_property_t property = class_getProperty(aClass, [key UTF8String]);
        const char *attr = property_getAttributes(property);
        NSString *strAttr = [NSString stringWithUTF8String:attr];
        
        if ([strAttr rangeOfString:NSStringFromClass([NSArray class])].location != NSNotFound || [strAttr rangeOfString:NSStringFromClass([NSMutableArray class])].location != NSNotFound || [strAttr rangeOfString:NSStringFromClass([NSSet class])].location != NSNotFound || [strAttr rangeOfString:NSStringFromClass([NSMutableSet class])].location != NSNotFound) {
            [keys addObject:key];
        }
    }
    
    return keys.count > 0 ? keys : nil;
}

- (BOOL)reflect:(NSDictionary *)obj {
    NSMutableSet * keys = [self propertyKeys:YES];
    for (NSString * key in keys) {
        id value = [obj valueForKey:key];
        if ([value isEqual:[NSNull null]] || value == nil) {
            continue;
        }
        
        [self setValue:value forKey:key];
    }
    
    return YES;
}

@end
