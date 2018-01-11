//
//  LFontTableView.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/4.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LFontTableView.h"

@interface LFontTableView()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray * data;

@end

@implementation LFontTableView

#pragma mark - Interface

- (NSMutableArray *)data {
    if (!_data) {
        _data = [[NSMutableArray alloc] initWithCapacity:128];
        
        NSMutableArray * weights = [[NSMutableArray alloc] initWithCapacity:128];
        [weights addObject:[NSNumber numberWithFloat:UIFontWeightUltraLight]];
        [weights addObject:[NSNumber numberWithFloat:UIFontWeightThin]];
        [weights addObject:[NSNumber numberWithFloat:UIFontWeightLight]];
        [weights addObject:[NSNumber numberWithFloat:UIFontWeightRegular]];
        [weights addObject:[NSNumber numberWithFloat:UIFontWeightMedium]];
        [weights addObject:[NSNumber numberWithFloat:UIFontWeightSemibold]];
        [weights addObject:[NSNumber numberWithFloat:UIFontWeightBold]];
        [weights addObject:[NSNumber numberWithFloat:UIFontWeightHeavy]];
        [weights addObject:[NSNumber numberWithFloat:UIFontWeightBlack]];
        
        for (int i = 5; i < 31; i++) {
            for (NSNumber * weight in weights) {
                LFontModel * model = [[LFontModel alloc] init];
                model.text = [NSString stringWithFormat:@"%d%@%@", i, [NSUUID UUID].UUIDString, weight];
                model.size = i;
                model.weight = weight.floatValue;
                
                [_data addObject:model];
            }
        }
    }
    
    return _data;
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.rowHeight = UITableViewAutomaticDimension;
    self.dataSource = self;
    self.delegate = self;
    [self registerClass:LFontCell.class forCellReuseIdentifier:@"LFontCell"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LFontCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LFontCell" forIndexPath:indexPath];
    cell.model = [self.data objectAtIndex:indexPath.row];
    
    return cell;
}

@end
