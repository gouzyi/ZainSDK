//
//  ZainCell.h
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PresentProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZainCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (nonatomic, assign) id<PersonDelegate>delegate;


@end

NS_ASSUME_NONNULL_END
