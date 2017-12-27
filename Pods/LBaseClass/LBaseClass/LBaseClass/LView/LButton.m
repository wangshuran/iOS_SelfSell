//
//  LButton.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 leeqiang. All rights reserved.
//

#import "LButton.h"
#import "LDefine.h"

@implementation LButton

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

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self initialize];
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"uid:%@__createTime:%f", self.uid, self.createTime];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    _logImport();
}

#pragma mark - LInitProtocol

- (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (self.uid) {
            @throw [NSException exceptionWithName:[NSString stringWithFormat:@"repeat execute %@", NSStringFromSelector(_cmd)] reason:[NSString stringWithFormat:@"repeat execute %@", NSStringFromSelector(_cmd)] userInfo:nil];
        }
        
        _uid = [NSUUID UUID].UUIDString;
        _createTime = [[NSDate date] timeIntervalSince1970];
    });
        
    self.backgroundColor = [UIColor whiteColor];
}

@end
