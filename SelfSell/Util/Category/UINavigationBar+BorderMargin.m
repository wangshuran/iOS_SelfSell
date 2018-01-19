//
//  UINavigationBar+BorderMargin.m
//  SelfSell
//
//  Created by liqiang on 2018/1/19.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "UINavigationBar+BorderMargin.h"

void swizzleInstanceMethod(Class cls, SEL originSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(cls, originSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    
    if (class_addMethod(cls, originSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation UINavigationBar(BorderMargin)

+ (void)load {
    if (@available(iOS 11.0, *)) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            swizzleInstanceMethod(self, @selector(layoutSubviews), @selector(wx_layoutSubviews));
        });
    }
}

- (void)wx_layoutSubviews {
    //[self wx_layoutSubviews];
    //[self printViewTree];
    
    for (UIView *view in self.subviews) {
        for (UIView *stackView in view.subviews) {
            if (@available(iOS 9.0, *)) {
                if ([stackView isKindOfClass:[UIStackView class]]) {                
                    //stackView.superview.layoutMargins = UIEdgeInsetsZero;
                    view.layoutMargins = UIEdgeInsetsZero;                    

                    break;
                }
            }
        }
    }
}

@end
