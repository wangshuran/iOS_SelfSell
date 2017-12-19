//
//  UIColor+Category.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/15.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor(Category)

#pragma mark - Interface

+ (UIColor *)randomColor {
    return [UIColor colorWithRed:arc4random_uniform(256) / 255.0f green:arc4random_uniform(256) / 255.0f blue:arc4random_uniform(256) / 255.0f alpha:arc4random_uniform(101) / 100.0f];
}

- (CGFloat)getR {
    size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
    if (numComponents == 4) {
        const CGFloat * components = CGColorGetComponents(self.CGColor);
        return components[0];
    }
    
    return 0.0f;
}

- (CGFloat)getG {
    size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
    if (numComponents == 4) {
        const CGFloat * components = CGColorGetComponents(self.CGColor);
        return components[1];
    }
    
    return 0.0f;
}

- (CGFloat)getB {
    size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
    if (numComponents == 4) {
        const CGFloat * components = CGColorGetComponents(self.CGColor);
        return components[2];
    }
    
    return 0.0f;
}

- (CGFloat)getA {
    size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
    if (numComponents == 4) {
        const CGFloat * components = CGColorGetComponents(self.CGColor);
        return components[3];
    }
    
    return 0.0f;
}

- (BOOL)isDark {
    size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
    if (numComponents == 4) {
        CGFloat R, G, B;
        
        const CGFloat * components = CGColorGetComponents(self.CGColor);
        R = components[0];
        G = components[1];
        B = components[2];
        
        CGFloat y = R * 0.299f + G * 0.587f + B * 0.114f;
        
        return y < 192.0f;
    }
    
    return NO;
}

@end
