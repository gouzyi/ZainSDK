//
//  ZainCell.m
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "ZainCell.h"

@interface ZainCell()
@property (nonatomic, assign) NSInteger age;
@end

@implementation ZainCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (IBAction)buttonClick:(UIButton *)sender {
    NSInteger age = [self.numLab.text integerValue];
    age += 1;
    self.numLab.text = [NSString stringWithFormat:@"%d", age];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickButtonWithNum:indexPath:)]) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:sender.tag inSection:0];
        [self.delegate didClickButtonWithNum:self.numLab.text indexPath:indexPath];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
