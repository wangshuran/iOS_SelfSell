//
//  NSData+Hex.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "NSData+Hex.h"

@implementation NSData(Hex)

#pragma mark - Interface

- (NSString *)toHex {
    NSMutableString * string = [[NSMutableString alloc] initWithCapacity:self.length];
    
    [self enumerateByteRangesUsingBlock:^(const void * bytes, NSRange byteRange, BOOL * stop) {
        unsigned char * dataBytes = (unsigned char *)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString * hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if (hexStr.length == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    
    return string;
}

@end
