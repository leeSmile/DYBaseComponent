//
//  UIView+AutoSize.h
//  DYZB
//
//  Created by houjihu on 15/10/13.
//  Copyright © 2015年 mydouyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (AutoSize)

+ (void)autoHeightWithConstraintForView:(UIView *)view;
+ (void)autoHeightWithFrameForView:(UIView *)view;
+ (void)autoWidthWithConstraintForView:(UIView *)view;

@end
