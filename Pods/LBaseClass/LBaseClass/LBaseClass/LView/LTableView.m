//
//  LTableView.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/30.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LTableView.h"
#import "LDefine.h"

@implementation LTableView

#pragma mark - Interface

//- (instancetype)init {
//    self = [super init];
//    [self initialize];
//    
//    return self;
//}

//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    [self initialize];
//    
//    return self;
//}

//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//    [self initialize];
//    
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];    
    [self initialize];
    
    return self;
}

- (NSString *)description {
    _logRetainCount(self);
    
    return [NSString stringWithFormat:@"class:%@__uid:%@__createTime:%f", self.class, self.uid, self.createTime];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    _logImport();
}

- (void)layoutUI {
    
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
    //});
}

@end
