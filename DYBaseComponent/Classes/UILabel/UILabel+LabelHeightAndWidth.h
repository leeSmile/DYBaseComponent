//
//  UILabel+LabelHeightAndWidth.h
//  QEZB
//
//  Created by qie on 16/6/21.
//  Copyright © 2016年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LabelHeightAndWidth)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

// 设置非normal字体大小
- (void)setupFont:(CGFloat)font weight:(UIFontWeight)fontWeight;

@end
