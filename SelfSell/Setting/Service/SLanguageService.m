//
//  SLanguageService.m
//  SelfSell
//
//  Created by liqiang on 2018/1/17.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SLanguageService.h"

@implementation SLanguageService

#pragma mark - LCmdProtocol

- (RACDisposable *)cmdHandle:(LCmdTransfer *)transfer subscriber:(id<RACSubscriber>)subscriber {
    if ([transfer.cmd isEqualToString:LCmdGetAll]) {
        [self.subject sendNext:[LCmdTransfer cmd:transfer.cmd value:[self getAll]]];
    }
    
    [subscriber sendNext:transfer];
    [subscriber sendCompleted];
    
    return nil;
}

#pragma mark - Private

- (NSArray<NSArray<TBModel *> *> *)getAll {
    NSArray * languages = [[AppContext sharedAppContext] getAppSupportLanguage];
    NSMutableArray *data = [[NSMutableArray alloc] initWithCapacity:languages.count];
    for (NSDictionary * language in languages) {
        NSNumber * index = [language objectForKey:@"index"];
        NSString * code = [language objectForKey:@"code"];
        NSString * value = [language objectForKey:@"value"];
        NSNumber * ischeck = [language objectForKey:@"ischeck"];
        
        TBCheckModel * model = [[TBCheckModel alloc] init];
        model.uid = code;
        model.title = value;
        model.isCheck = ischeck.boolValue;
        [data addObject:model];
    }
    
    TBSectionModel * section = [[TBSectionModel alloc] init];
    section.items = data;
    
    return [NSArray arrayWithObject:section];
}

@end
