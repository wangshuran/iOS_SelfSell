//
//  LFont.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/4.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LFont.h"

@implementation LFont

#pragma mark - Interface

+ (UIFont *)ultraLight:(CGFloat)size {return [UIFont systemFontOfSize:size weight:UIFontWeightUltraLight];}
+ (UIFont *)thin:(CGFloat)size {return [UIFont systemFontOfSize:size weight:UIFontWeightThin];}
+ (UIFont *)light:(CGFloat)size {return [UIFont systemFontOfSize:size weight:UIFontWeightLight];}
+ (UIFont *)regular:(CGFloat)size {return [UIFont systemFontOfSize:size weight:UIFontWeightRegular];}
+ (UIFont *)medium:(CGFloat)size {return [UIFont systemFontOfSize:size weight:UIFontWeightMedium];}
+ (UIFont *)semibold:(CGFloat)size {return [UIFont systemFontOfSize:size weight:UIFontWeightSemibold];}
+ (UIFont *)bold:(CGFloat)size {return [UIFont systemFontOfSize:size weight:UIFontWeightBold];}
+ (UIFont *)heavy:(CGFloat)size {return [UIFont systemFontOfSize:size weight:UIFontWeightHeavy];}
+ (UIFont *)black:(CGFloat)size {return [UIFont systemFontOfSize:size weight:UIFontWeightBlack];}

+ (UIFont *)ultraLight_5 {return [LFont ultraLight:5.0f];};
+ (UIFont *)thin_5 {return [LFont thin:5.0f];};
+ (UIFont *)light_5 {return [LFont light:5.0f];};
+ (UIFont *)regular_5 {return [LFont regular:5.0f];};
+ (UIFont *)medium_5 {return [LFont medium:5.0f];};
+ (UIFont *)semibold_5 {return [LFont semibold:5.0f];};
+ (UIFont *)bold_5 {return [LFont bold:5.0f];};
+ (UIFont *)heavy_5 {return [LFont heavy:5.0f];};
+ (UIFont *)black_5 {return [LFont black:5.0f];};

+ (UIFont *)ultraLight_6 {return [LFont ultraLight:6.0f];};
+ (UIFont *)thin_6 {return [LFont thin:6.0f];};
+ (UIFont *)light_6 {return [LFont light:6.0f];};
+ (UIFont *)regular_6 {return [LFont regular:6.0f];};
+ (UIFont *)medium_6 {return [LFont medium:6.0f];};
+ (UIFont *)semibold_6 {return [LFont semibold:6.0f];};
+ (UIFont *)bold_6 {return [LFont bold:6.0f];};
+ (UIFont *)heavy_6 {return [LFont heavy:6.0f];};
+ (UIFont *)black_6 {return [LFont black:6.0f];};

+ (UIFont *)ultraLight_7 {return [LFont ultraLight:7.0f];};
+ (UIFont *)thin_7 {return [LFont thin:7.0f];};
+ (UIFont *)light_7 {return [LFont light:7.0f];};
+ (UIFont *)regular_7 {return [LFont regular:7.0f];};
+ (UIFont *)medium_7 {return [LFont medium:7.0f];};
+ (UIFont *)semibold_7 {return [LFont semibold:7.0f];};
+ (UIFont *)bold_7 {return [LFont bold:7.0f];};
+ (UIFont *)heavy_7 {return [LFont heavy:7.0f];};
+ (UIFont *)black_7 {return [LFont black:7.0f];};

+ (UIFont *)ultraLight_8 {return [LFont ultraLight:8.0f];};
+ (UIFont *)thin_8 {return [LFont thin:8.0f];};
+ (UIFont *)light_8 {return [LFont light:8.0f];};
+ (UIFont *)regular_8 {return [LFont regular:8.0f];};
+ (UIFont *)medium_8 {return [LFont medium:8.0f];};
+ (UIFont *)semibold_8 {return [LFont semibold:8.0f];};
+ (UIFont *)bold_8 {return [LFont bold:8.0f];};
+ (UIFont *)heavy_8 {return [LFont heavy:8.0f];};
+ (UIFont *)black_8 {return [LFont black:8.0f];};

+ (UIFont *)ultraLight_9 {return [LFont ultraLight:9.0f];};
+ (UIFont *)thin_9 {return [LFont thin:9.0f];};
+ (UIFont *)light_9 {return [LFont light:9.0f];};
+ (UIFont *)regular_9 {return [LFont regular:9.0f];};
+ (UIFont *)medium_9 {return [LFont medium:9.0f];};
+ (UIFont *)semibold_9 {return [LFont semibold:9.0f];};
+ (UIFont *)bold_9 {return [LFont bold:9.0f];};
+ (UIFont *)heavy_9 {return [LFont heavy:9.0f];};
+ (UIFont *)black_9 {return [LFont black:9.0f];};

+ (UIFont *)ultraLight_10 {return [LFont ultraLight:10.0f];};
+ (UIFont *)thin_10 {return [LFont thin:10.0f];};
+ (UIFont *)light_10 {return [LFont light:10.0f];};
+ (UIFont *)regular_10 {return [LFont regular:10.0f];};
+ (UIFont *)medium_10 {return [LFont medium:10.0f];};
+ (UIFont *)semibold_10 {return [LFont semibold:10.0f];};
+ (UIFont *)bold_10 {return [LFont bold:10.0f];};
+ (UIFont *)heavy_10 {return [LFont heavy:10.0f];};
+ (UIFont *)black_10 {return [LFont black:10.0f];};

+ (UIFont *)ultraLight_11 {return [LFont ultraLight:11.0f];};
+ (UIFont *)thin_11 {return [LFont thin:11.0f];};
+ (UIFont *)light_11 {return [LFont light:11.0f];};
+ (UIFont *)regular_11 {return [LFont regular:11.0f];};
+ (UIFont *)medium_11 {return [LFont medium:11.0f];};
+ (UIFont *)semibold_11 {return [LFont semibold:11.0f];};
+ (UIFont *)bold_11 {return [LFont bold:11.0f];};
+ (UIFont *)heavy_11 {return [LFont heavy:11.0f];};
+ (UIFont *)black_11 {return [LFont black:11.0f];};

+ (UIFont *)ultraLight_12 {return [LFont ultraLight:12.0f];};
+ (UIFont *)thin_12 {return [LFont thin:12.0f];};
+ (UIFont *)light_12 {return [LFont light:12.0f];};
+ (UIFont *)regular_12 {return [LFont regular:12.0f];};
+ (UIFont *)medium_12 {return [LFont medium:12.0f];};
+ (UIFont *)semibold_12 {return [LFont semibold:12.0f];};
+ (UIFont *)bold_12 {return [LFont bold:12.0f];};
+ (UIFont *)heavy_12 {return [LFont heavy:12.0f];};
+ (UIFont *)black_12 {return [LFont black:12.0f];};

+ (UIFont *)ultraLight_13 {return [LFont ultraLight:13.0f];};
+ (UIFont *)thin_13 {return [LFont thin:13.0f];};
+ (UIFont *)light_13 {return [LFont light:13.0f];};
+ (UIFont *)regular_13 {return [LFont regular:13.0f];};
+ (UIFont *)medium_13 {return [LFont medium:13.0f];};
+ (UIFont *)semibold_13 {return [LFont semibold:13.0f];};
+ (UIFont *)bold_13 {return [LFont bold:13.0f];};
+ (UIFont *)heavy_13 {return [LFont heavy:13.0f];};
+ (UIFont *)black_13 {return [LFont black:13.0f];};

+ (UIFont *)ultraLight_14 {return [LFont ultraLight:14.0f];};
+ (UIFont *)thin_14 {return [LFont thin:14.0f];};
+ (UIFont *)light_14 {return [LFont light:14.0f];};
+ (UIFont *)regular_14 {return [LFont regular:14.0f];};
+ (UIFont *)medium_14 {return [LFont medium:14.0f];};
+ (UIFont *)semibold_14 {return [LFont semibold:14.0f];};
+ (UIFont *)bold_14 {return [LFont bold:14.0f];};
+ (UIFont *)heavy_14 {return [LFont heavy:14.0f];};
+ (UIFont *)black_14 {return [LFont black:14.0f];};

+ (UIFont *)ultraLight_15 {return [LFont ultraLight:15.0f];};
+ (UIFont *)thin_15 {return [LFont thin:15.0f];};
+ (UIFont *)light_15 {return [LFont light:15.0f];};
+ (UIFont *)regular_15 {return [LFont regular:15.0f];};
+ (UIFont *)medium_15 {return [LFont medium:15.0f];};
+ (UIFont *)semibold_15 {return [LFont semibold:15.0f];};
+ (UIFont *)bold_15 {return [LFont bold:15.0f];};
+ (UIFont *)heavy_15 {return [LFont heavy:15.0f];};
+ (UIFont *)black_15 {return [LFont black:15.0f];};

+ (UIFont *)ultraLight_16 {return [LFont ultraLight:16.0f];};
+ (UIFont *)thin_16 {return [LFont thin:16.0f];};
+ (UIFont *)light_16 {return [LFont light:16.0f];};
+ (UIFont *)regular_16 {return [LFont regular:16.0f];};
+ (UIFont *)medium_16 {return [LFont medium:16.0f];};
+ (UIFont *)semibold_16 {return [LFont semibold:16.0f];};
+ (UIFont *)bold_16 {return [LFont bold:16.0f];};
+ (UIFont *)heavy_16 {return [LFont heavy:16.0f];};
+ (UIFont *)black_16 {return [LFont black:16.0f];};

+ (UIFont *)ultraLight_17 {return [LFont ultraLight:17.0f];};
+ (UIFont *)thin_17 {return [LFont thin:17.0f];};
+ (UIFont *)light_17 {return [LFont light:17.0f];};
+ (UIFont *)regular_17 {return [LFont regular:17.0f];};
+ (UIFont *)medium_17 {return [LFont medium:17.0f];};
+ (UIFont *)semibold_17 {return [LFont semibold:17.0f];};
+ (UIFont *)bold_17 {return [LFont bold:17.0f];};
+ (UIFont *)heavy_17 {return [LFont heavy:17.0f];};
+ (UIFont *)black_17 {return [LFont black:17.0f];};

+ (UIFont *)ultraLight_18 {return [LFont ultraLight:18.0f];};
+ (UIFont *)thin_18 {return [LFont thin:18.0f];};
+ (UIFont *)light_18 {return [LFont light:18.0f];};
+ (UIFont *)regular_18 {return [LFont regular:18.0f];};
+ (UIFont *)medium_18 {return [LFont medium:18.0f];};
+ (UIFont *)semibold_18 {return [LFont semibold:18.0f];};
+ (UIFont *)bold_18 {return [LFont bold:18.0f];};
+ (UIFont *)heavy_18 {return [LFont heavy:18.0f];};
+ (UIFont *)black_18 {return [LFont black:18.0f];};

+ (UIFont *)ultraLight_19 {return [LFont ultraLight:19.0f];};
+ (UIFont *)thin_19 {return [LFont thin:19.0f];};
+ (UIFont *)light_19 {return [LFont light:19.0f];};
+ (UIFont *)regular_19 {return [LFont regular:19.0f];};
+ (UIFont *)medium_19 {return [LFont medium:19.0f];};
+ (UIFont *)semibold_19 {return [LFont semibold:19.0f];};
+ (UIFont *)bold_19 {return [LFont bold:19.0f];};
+ (UIFont *)heavy_19 {return [LFont heavy:19.0f];};
+ (UIFont *)black_19 {return [LFont black:19.0f];};

+ (UIFont *)ultraLight_20 {return [LFont ultraLight:20.0f];};
+ (UIFont *)thin_20 {return [LFont thin:20.0f];};
+ (UIFont *)light_20 {return [LFont light:20.0f];};
+ (UIFont *)regular_20 {return [LFont regular:20.0f];};
+ (UIFont *)medium_20 {return [LFont medium:20.0f];};
+ (UIFont *)semibold_20 {return [LFont semibold:20.0f];};
+ (UIFont *)bold_20 {return [LFont bold:20.0f];};
+ (UIFont *)heavy_20 {return [LFont heavy:20.0f];};
+ (UIFont *)black_20 {return [LFont black:20.0f];};

+ (UIFont *)ultraLight_21 {return [LFont ultraLight:21.0f];};
+ (UIFont *)thin_21 {return [LFont thin:21.0f];};
+ (UIFont *)light_21 {return [LFont light:21.0f];};
+ (UIFont *)regular_21 {return [LFont regular:21.0f];};
+ (UIFont *)medium_21 {return [LFont medium:21.0f];};
+ (UIFont *)semibold_21 {return [LFont semibold:21.0f];};
+ (UIFont *)bold_21 {return [LFont bold:21.0f];};
+ (UIFont *)heavy_21 {return [LFont heavy:21.0f];};
+ (UIFont *)black_21 {return [LFont black:21.0f];};

+ (UIFont *)ultraLight_22 {return [LFont ultraLight:22.0f];};
+ (UIFont *)thin_22 {return [LFont thin:22.0f];};
+ (UIFont *)light_22 {return [LFont light:22.0f];};
+ (UIFont *)regular_22 {return [LFont regular:22.0f];};
+ (UIFont *)medium_22 {return [LFont medium:22.0f];};
+ (UIFont *)semibold_22 {return [LFont semibold:22.0f];};
+ (UIFont *)bold_22 {return [LFont bold:22.0f];};
+ (UIFont *)heavy_22 {return [LFont heavy:22.0f];};
+ (UIFont *)black_22 {return [LFont black:22.0f];};

+ (UIFont *)ultraLight_23 {return [LFont ultraLight:23.0f];};
+ (UIFont *)thin_23 {return [LFont thin:23.0f];};
+ (UIFont *)light_23 {return [LFont light:23.0f];};
+ (UIFont *)regular_23 {return [LFont regular:23.0f];};
+ (UIFont *)medium_23 {return [LFont medium:23.0f];};
+ (UIFont *)semibold_23 {return [LFont semibold:23.0f];};
+ (UIFont *)bold_23 {return [LFont bold:23.0f];};
+ (UIFont *)heavy_23 {return [LFont heavy:23.0f];};
+ (UIFont *)black_23 {return [LFont black:23.0f];};

+ (UIFont *)ultraLight_24 {return [LFont ultraLight:24.0f];};
+ (UIFont *)thin_24 {return [LFont thin:24.0f];};
+ (UIFont *)light_24 {return [LFont light:24.0f];};
+ (UIFont *)regular_24 {return [LFont regular:24.0f];};
+ (UIFont *)medium_24 {return [LFont medium:24.0f];};
+ (UIFont *)semibold_24 {return [LFont semibold:24.0f];};
+ (UIFont *)bold_24 {return [LFont bold:24.0f];};
+ (UIFont *)heavy_24 {return [LFont heavy:24.0f];};
+ (UIFont *)black_24 {return [LFont black:24.0f];};

+ (UIFont *)ultraLight_25 {return [LFont ultraLight:25.0f];};
+ (UIFont *)thin_25 {return [LFont thin:25.0f];};
+ (UIFont *)light_25 {return [LFont light:25.0f];};
+ (UIFont *)regular_25 {return [LFont regular:25.0f];};
+ (UIFont *)medium_25 {return [LFont medium:25.0f];};
+ (UIFont *)semibold_25 {return [LFont semibold:25.0f];};
+ (UIFont *)bold_25 {return [LFont bold:25.0f];};
+ (UIFont *)heavy_25 {return [LFont heavy:25.0f];};
+ (UIFont *)black_25 {return [LFont black:25.0f];};

+ (UIFont *)ultraLight_26 {return [LFont ultraLight:26.0f];};
+ (UIFont *)thin_26 {return [LFont thin:26.0f];};
+ (UIFont *)light_26 {return [LFont light:26.0f];};
+ (UIFont *)regular_26 {return [LFont regular:26.0f];};
+ (UIFont *)medium_26 {return [LFont medium:26.0f];};
+ (UIFont *)semibold_26 {return [LFont semibold:26.0f];};
+ (UIFont *)bold_26 {return [LFont bold:26.0f];};
+ (UIFont *)heavy_26 {return [LFont heavy:26.0f];};
+ (UIFont *)black_26 {return [LFont black:26.0f];};

+ (UIFont *)ultraLight_27 {return [LFont ultraLight:27.0f];};
+ (UIFont *)thin_27 {return [LFont thin:27.0f];};
+ (UIFont *)light_27 {return [LFont light:27.0f];};
+ (UIFont *)regular_27 {return [LFont regular:27.0f];};
+ (UIFont *)medium_27 {return [LFont medium:27.0f];};
+ (UIFont *)semibold_27 {return [LFont semibold:27.0f];};
+ (UIFont *)bold_27 {return [LFont bold:27.0f];};
+ (UIFont *)heavy_27 {return [LFont heavy:27.0f];};
+ (UIFont *)black_27 {return [LFont black:27.0f];};

+ (UIFont *)ultraLight_28 {return [LFont ultraLight:28.0f];};
+ (UIFont *)thin_28 {return [LFont thin:28.0f];};
+ (UIFont *)light_28 {return [LFont light:28.0f];};
+ (UIFont *)regular_28 {return [LFont regular:28.0f];};
+ (UIFont *)medium_28 {return [LFont medium:28.0f];};
+ (UIFont *)semibold_28 {return [LFont semibold:28.0f];};
+ (UIFont *)bold_28 {return [LFont bold:28.0f];};
+ (UIFont *)heavy_28 {return [LFont heavy:28.0f];};
+ (UIFont *)black_28 {return [LFont black:28.0f];};

+ (UIFont *)ultraLight_29 {return [LFont ultraLight:29.0f];};
+ (UIFont *)thin_29 {return [LFont thin:29.0f];};
+ (UIFont *)light_29 {return [LFont light:29.0f];};
+ (UIFont *)regular_29 {return [LFont regular:29.0f];};
+ (UIFont *)medium_29 {return [LFont medium:29.0f];};
+ (UIFont *)semibold_29 {return [LFont semibold:29.0f];};
+ (UIFont *)bold_29 {return [LFont bold:29.0f];};
+ (UIFont *)heavy_29 {return [LFont heavy:29.0f];};
+ (UIFont *)black_29 {return [LFont black:29.0f];};

+ (UIFont *)ultraLight_30 {return [LFont ultraLight:30.0f];};
+ (UIFont *)thin_30 {return [LFont thin:30.0f];};
+ (UIFont *)light_30 {return [LFont light:30.0f];};
+ (UIFont *)regular_30 {return [LFont regular:30.0f];};
+ (UIFont *)medium_30 {return [LFont medium:30.0f];};
+ (UIFont *)semibold_30 {return [LFont semibold:30.0f];};
+ (UIFont *)bold_30 {return [LFont bold:30.0f];};
+ (UIFont *)heavy_30 {return [LFont heavy:30.0f];};
+ (UIFont *)black_30 {return [LFont black:30.0f];};

@end
