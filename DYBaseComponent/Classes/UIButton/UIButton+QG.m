//
//  UIButton+QG.m
//  新鲜智造
//
//  Created by QG on 16/3/2.
//  Copyright © 2016年 新鲜智造. All rights reserved.
//

#import "UIButton+QG.h"

@implementation UIButton (QG)


+(instancetype )creatButtonWithTitle:(NSString *)title nomalImage:(UIImage *)norImg highLightImg:(UIImage *)hightImg selectImg:(UIImage *)selectImg bgImg:(UIImage *)bgImg{
    UIButton * button = [[self class] buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:norImg forState:UIControlStateNormal];
    [button setImage:hightImg forState:UIControlStateHighlighted];
    [button setImage:selectImg forState:UIControlStateSelected];
    [button setBackgroundImage:bgImg forState:UIControlStateNormal];
    return button;
}


@end
