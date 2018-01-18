//
//  LImageView.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LImageView.h"
#import "LDefine.h"

@implementation LImageView

#pragma mark - Interface

- (instancetype)init {
    self = [super init];
    
    [self initialize];
    
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    
//    [self initialize];
//    
//    return self;
//}

//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//    
//    [self initialize];
//    
//    return self;
//}

- (instancetype)initWithImage:(UIImage *)image {
    self = [super initWithImage:image];
    
    [self initialize];
    
    return self;
}

- (instancetype)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
    self = [super initWithImage:image highlightedImage:highlightedImage];
    
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
    self.backgroundColor = [UIColor whiteColor];
    //});
}

@end
