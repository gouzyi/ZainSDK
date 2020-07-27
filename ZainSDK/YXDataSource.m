//
//  YXDataSource.m
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/7.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "YXDataSource.h"

@interface YXDataSource ()

@property (nonatomic, copy) ConfigureCellBlock configureCellBlock;
@property (nonatomic, copy) DidSlectCellBlock didSelectCellBlock;

@end

@implementation YXDataSource

- (id)initWithIdentifier:(NSString *)identifier
      configureCellBlock:(ConfigureCellBlock)configureCellBlock {
    YXDataSource *source = [[YXDataSource alloc] initWithIdentifier:identifier configureCellBlock:configureCellBlock didSelectCellBlock:nil];
    return source;
}
- (id)initWithIdentifier:(NSString *)identifier
      configureCellBlock:(ConfigureCellBlock)configureCellBlock didSelectCellBlock:(DidSlectCellBlock)didSelectCellBlock {
    if (self = [super init]) {
        _cellIdentifier = identifier;
        _configureCellBlock = [configureCellBlock copy];
        _didSelectCellBlock = [didSelectCellBlock copy];
    }
    return self;
}

- (void)addDataArr:(NSArray *)dataArr {
    if (!dataArr.count) {
        return;
    }
    if (self.dataArr.count) {
        [self.dataArr removeAllObjects];
    }
    [self.dataArr addObjectsFromArray:dataArr];
}


- (id)modelAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataArr.count > indexPath.row ? self.dataArr[indexPath.row] : nil;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id model = [self modelAtIndexPath:indexPath];
    if (self.configureCellBlock) {
        self.configureCellBlock(cell, model, indexPath);
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = [self modelAtIndexPath:indexPath];
    id cell = [tableView cellForRowAtIndexPath:indexPath];
    if (self.didSelectCellBlock) {
        self.didSelectCellBlock(cell, model, indexPath);
    }
}
#pragma mark - Lazy Loads

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
@end
