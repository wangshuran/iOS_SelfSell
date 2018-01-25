//
//  UIImage+LaunchImage.m
//  SelfSell
//
//  Created by liqiang on 2018/1/25.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "UIImage+LaunchImage.h"

@implementation UIImage(LaunchImage)

+ (instancetype)getLaunchImage{
    CGSize size = UIScreen.mainScreen.bounds.size;
    
    UIInterfaceOrientation oritation = [UIApplication sharedApplication].statusBarOrientation;
    BOOL isLand = oritation == UIDeviceOrientationLandscapeLeft || oritation == UIDeviceOrientationLandscapeRight;
    
    NSString * viewOrientation = isLand ? @"Landscape" : @"Portrait";
    NSString * launchImage = nil;
    NSArray * imagesDict = [NSBundle.mainBundle.infoDictionary valueForKey:@"UILaunchImages"];
    for (NSDictionary * dict in imagesDict) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, size) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            launchImage = dict[@"UILaunchImageName"];
            break;
        }
    }
    UIImage * image = [UIImage imageNamed:launchImage];
    //if (!image) {
    //    //不知为啥，ipad横屏一直无法正常获取，故在此写死。如果需要切换启动图，需要更换响应文件
    //    image = [UIImage imageNamed:@"iPadLandScape.png"];
    //}
    return image;
}

@end
