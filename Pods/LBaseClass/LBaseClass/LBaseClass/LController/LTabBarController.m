//
//  LTabBarController.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LTabBarController.h"
#import "LDefine.h"
#import <objc/runtime.h>

@interface LTabBarController ()

@end

@implementation LTabBarController

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

- (BOOL)shouldAutorotate {
    return self.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.selectedViewController.supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return self.selectedViewController.preferredInterfaceOrientationForPresentation;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.selectedViewController.preferredStatusBarStyle;
}

- (CGSize)preferredContentSize {
    return self.selectedViewController.preferredContentSize;
}

- (BOOL)prefersStatusBarHidden {
    return self.selectedViewController.prefersStatusBarHidden;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return self.selectedViewController.preferredStatusBarUpdateAnimation;
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
    
    _uid = [NSUUID UUID].UUIDString;
    _createTime = [[NSDate date] timeIntervalSince1970];        
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
        
        if (!isIncludeParent || aClass == nil || aClass == LTabBarController.class) {
            break;
        }
        
        aClass = aClass.superclass;
    }
    
    return keys.count == 0 ? nil : keys;
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
