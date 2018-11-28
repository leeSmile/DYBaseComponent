//
//  UILabel+LabelHeightAndWidth.m
//  QEZB
//
//  Created by qie on 16/6/21.
//  Copyright © 2016年 zhou. All rights reserved.
//

#import "UILabel+LabelHeightAndWidth.h"

@implementation UILabel (LabelHeightAndWidth)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}

- (void)setupFont:(CGFloat)font weight:(UIFontWeight)fontWeight {
    if ([UIDevice currentDevice].systemVersion.floatValue < 8.2) {
        self.font = [UIFont systemFontOfSize:font];
    }
    else {
        self.font = [UIFont systemFontOfSize:font weight:fontWeight];
    }
}

@end
