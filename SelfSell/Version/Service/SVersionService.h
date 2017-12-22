//
//  SVersionService.h
//  SelfSell
//
//  Created by liqiang on 2017/12/22.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SVersionModel.h"

@interface SVersionService : NSObject

- (SVersionModel *)getVersionModel;
    
@end
