//
//  NSString+MD5.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString(MD5)

- (NSString *)MD5 {
    const char * cStr = self.UTF8String;
    unsigned char digest[16];
    
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString * output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return  output;
}

@end
