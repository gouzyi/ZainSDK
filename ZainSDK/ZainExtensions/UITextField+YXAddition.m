//
//  UITextField+YXAddition.m
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import "UITextField+YXAddition.h"
#import <objc/runtime.h>

static const void *PlaceHolderColorKey = &PlaceHolderColorKey;
static const void *LimitCountKey = &LimitCountKey;

@implementation UITextField (YXAddition)

- (NSInteger)limitCount {
    return [objc_getAssociatedObject(self, LimitCountKey) integerValue];
}
- (void)setLimitCount:(NSInteger)limitCount {
    
    objc_setAssociatedObject(self, LimitCountKey, [NSString stringWithFormat:@"%ld",(long)limitCount], OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(changeText:) forControlEvents:UIControlEventEditingChanged];
    
}
- (UIColor *)placeholderColor {
    
    return objc_getAssociatedObject(self, PlaceHolderColorKey);
}
- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    
    objc_setAssociatedObject(self, PlaceHolderColorKey, placeholderColor,  OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}
- (BOOL)forbiddenSpace {
    return [objc_getAssociatedObject(self, @selector(forbiddenSpace)) boolValue];
}
- (void)setForbiddenSpace:(BOOL)forbiddenSpace {
    
    objc_setAssociatedObject(self, @selector(forbiddenSpace), [NSString stringWithFormat:@"%ld", (long)forbiddenSpace], OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(changeText:) forControlEvents:UIControlEventEditingChanged];

}

#pragma mark -

- (void)changeText:(UITextField *)textField {
    
    if (self.forbiddenSpace) {
        NSString *str = [self.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        self.text = str;
    }
    NSString *toBeString = textField.text;
    // 键盘输入模式
    NSString *lang = [textField textInputMode].primaryLanguage;
    if ([lang isEqualToString:@"zh-Hans"]) {
        // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        int chNum =0;
        for (int i=0; i<toBeString.length; ++i) {
            NSRange range = NSMakeRange(i, 1);
            NSString *subString = [toBeString substringWithRange:range];
            const char *cString = [subString UTF8String];
            if (cString == nil) {
                chNum ++;
            } else if (strlen(cString) == 3) {
                chNum ++;
            }
        }
        if (!position) {
            if (toBeString.length > self.limitCount) {
                textField.text = [toBeString substringToIndex:self.limitCount];
            }
        } else {
            
        }
    } else {
        if (toBeString.length > self.limitCount) {
            textField.text = [toBeString substringToIndex:self.limitCount];
        }
    }
}


@end
