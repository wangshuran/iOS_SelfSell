//
//  SRequest.m
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SRequest.h"

@implementation SRequest

#pragma mark - Interface

- (NSString *)CFBundleVersion {
    return [LApp CFBundleVersion];
}

- (NSString *)CFBundleIdentifier {
    return [LApp CFBundleIdentifier];
}

- (NSString *)CFBundleShortVersionString {
    return [LApp CFBundleShortVersionString];
}

@end
