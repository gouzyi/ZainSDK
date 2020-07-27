//
//  YXDataSource.h
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/7.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef void(^ConfigureCellBlock)(id cell, id model, NSIndexPath *indexPath);
typedef void(^DidSlectCellBlock)(id cell, id model, NSIndexPath *indexpath);

@interface YXDataSource : NSObject<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) IBInspectable NSString *cellIdentifier;

- (id)initWithIdentifier:(NSString *)identifier
      configureCellBlock:(ConfigureCellBlock)configureCellBlock;

- (id)initWithIdentifier:(NSString *)identifier
      configureCellBlock:(ConfigureCellBlock)configureCellBlock
      didSelectCellBlock:(DidSlectCellBlock)didSelectCellBlock;

- (id)modelAtIndexPath:(NSIndexPath *)indexPath;

- (void)addDataArr:(NSArray *)dataArr;


@end

NS_ASSUME_NONNULL_END


