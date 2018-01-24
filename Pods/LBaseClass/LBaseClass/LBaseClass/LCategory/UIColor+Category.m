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

- (UIColor *)alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:[self getR] green:[self getG] blue:[self getB] alpha:[self getA] * alpha];
}

- (CGFloat)getR {
    size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
    CGFloat R = 0.0f;
    if (numComponents == 4) {
        const CGFloat * components = CGColorGetComponents(self.CGColor);
        R = components[0];
    }else {
        CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
        unsigned char resultingPixel[4];
        CGContextRef context = CGBitmapContextCreate(&resultingPixel, 1, 1, 8, 4, rgbColorSpace, kCGImageAlphaNoneSkipLast);
        CGContextSetFillColorWithColor(context, self.CGColor);
        CGContextFillRect(context, CGRectMake(0.0f, 0.0f, 1.0f, 1.0f));
        CGContextRelease(context);
        CGColorSpaceRelease(rgbColorSpace);
        R = resultingPixel[0] / 255.0f;
    }
    
    return R;
}

- (CGFloat)getG {
    size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
    CGFloat G = 0.0f;
    if (numComponents == 4) {
        const CGFloat * components = CGColorGetComponents(self.CGColor);
        G = components[1];
    }else {
        CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
        unsigned char resultingPixel[4];
        CGContextRef context = CGBitmapContextCreate(&resultingPixel, 1, 1, 8, 4, rgbColorSpace, kCGImageAlphaNoneSkipLast);
        CGContextSetFillColorWithColor(context, self.CGColor);
        CGContextFillRect(context, CGRectMake(0.0f, 0.0f, 1.0f, 1.0f));
        CGContextRelease(context);
        CGColorSpaceRelease(rgbColorSpace);
        G = resultingPixel[1] / 255.0f;
    }
    
    return G;
}

- (CGFloat)getB {
    size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
    CGFloat B = 0.0f;
    if (numComponents == 4) {
        const CGFloat * components = CGColorGetComponents(self.CGColor);
        B = components[2];
    }else {
        CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
        unsigned char resultingPixel[4];
        CGContextRef context = CGBitmapContextCreate(&resultingPixel, 1, 1, 8, 4, rgbColorSpace, kCGImageAlphaNoneSkipLast);
        CGContextSetFillColorWithColor(context, self.CGColor);
        CGContextFillRect(context, CGRectMake(0.0f, 0.0f, 1.0f, 1.0f));
        CGContextRelease(context);
        CGColorSpaceRelease(rgbColorSpace);
        B = resultingPixel[2] / 255.0f;
    }
    
    return B;
}

- (CGFloat)getA {
    size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
    CGFloat A;
    if (numComponents == 4) {
        const CGFloat * components = CGColorGetComponents(self.CGColor);
        A = components[3];
    }else {
        CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
        unsigned char resultingPixel[4];
        CGContextRef context = CGBitmapContextCreate(&resultingPixel, 1, 1, 8, 4, rgbColorSpace, kCGImageAlphaNoneSkipLast);
        CGContextSetFillColorWithColor(context, self.CGColor);
        CGContextFillRect(context, CGRectMake(0.0f, 0.0f, 1.0f, 1.0f));
        CGContextRelease(context);
        CGColorSpaceRelease(rgbColorSpace);
        A = resultingPixel[3] / 255.0f;
    }
    
    return A;
}

- (BOOL)isDark {
    size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
    CGFloat R, G, B = 0.0f;
    if (numComponents == 4) {
        const CGFloat * components = CGColorGetComponents(self.CGColor);
        R = components[0] * 255.0f;
        G = components[1] * 255.0f;
        B = components[2] * 255.0f;
    }else {
        CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
        unsigned char resultingPixel[4];
        CGContextRef context = CGBitmapContextCreate(&resultingPixel, 1, 1, 8, 4, rgbColorSpace, kCGImageAlphaNoneSkipLast);
        CGContextSetFillColorWithColor(context, self.CGColor);
        CGContextFillRect(context, CGRectMake(0.0f, 0.0f, 1.0f, 1.0f));
        CGContextRelease(context);
        CGColorSpaceRelease(rgbColorSpace);
        R = resultingPixel[0];
        G = resultingPixel[1];
        B = resultingPixel[2];
    }
    CGFloat y = R * 0.299f + G * 0.587f + B * 0.114f;
    
    return y < 192.0f;
}

@end
