//
//  UILabel+QG.m
//  新鲜智造
//
//  Created by QG on 16/3/2.
//  Copyright © 2016年 新鲜智造. All rights reserved.
//

#import "UILabel+QG.h"

@implementation UILabel (QG)


+(UILabel *)createLabelWithText:(NSString *)text BreakMode:(NSLineBreakMode)breakModel textFont:(UIFont *)font Lines:(int)lines andTextColor:(UIColor *)color{
    UILabel * label = [[UILabel alloc]init];
    label.text = text;
    label.numberOfLines = lines;
    if (lines != 0) {
        label.lineBreakMode = breakModel;
    }
    label.font = font;
    label.textColor = color;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

@end
