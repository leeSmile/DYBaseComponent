//
//  UILabel+QG.h
//  新鲜智造
//
//  Created by QG on 16/3/2.
//  Copyright © 2016年 新鲜智造. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (QG)


+(UILabel *)createLabelWithText:(NSString *)text BreakMode:(NSLineBreakMode)breakModel textFont:(UIFont *)font Lines:(int)lines andTextColor:(UIColor *)color;

@end
