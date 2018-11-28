//
//  UIView+QG.m
//  新鲜智造
//
//  Created by QG on 16/3/2.
//  Copyright © 2016年 新鲜智造. All rights reserved.
//

#import "UIView+QG.h"

@implementation UIView (QG)


+(UIView *)createViewWithBackgroundColor:(UIColor *)color{
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = color;
    return view;
}


@end
