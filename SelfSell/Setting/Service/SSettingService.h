//
//  SSettingService.h
//  SelfSell
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SService.h"
#import "TBArrowModel.h"
#import "TBBtnModel.h"
#import "TBModel.h"
#import "TBSectionModel.h"
#import "TBSwitchModel.h"
#import "TBTextModel.h"


FOUNDATION_EXPORT LCmd * const LCmdGetSetting0;
FOUNDATION_EXPORT LCmd * const LCmdGetSetting1;


#define kwodetuijianma @"kwodetuijianma"
#define kgugeyanzheng @"kgugeyanzheng"
#define kshezhi @"kshezhi"
#define ktuichu @"ktuichu"

#define kgenggaimima @"kgenggaimima"
#define kzhiwen @"kzhiwen"
#define kyuyan @"kyuyan"
#define kguanyu @"kguanyu"

@interface SSettingService : SService

@end
