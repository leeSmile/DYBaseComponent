//
//  UIView+AutoSize.m
//  DYZB
//
//  Created by houjihu on 15/10/13.
//  Copyright © 2015年 mydouyu. All rights reserved.
//

#import "UIView+AutoSize.h"

@implementation UIView (AutoSize)

#pragma mark - deal with label auto height and width
+ (void)autoHeightWithConstraintForView:(UIView *)view{
    //Calculate the expected size based on the font and linebreak mode of your view
    // FLT_MAX here simply means no constraint in height
    CGSize maximumViewSize = CGSizeMake(view.frame.size.width, FLT_MAX);
    
    //fix the layout in lower versions
    [view sizeToFit];
    
    CGSize expectedLabelSize = [view sizeThatFits:maximumViewSize];
    
    //add the new height constraint to the view
    for (NSLayoutConstraint *constraint in view.constraints) {
        if (constraint.firstItem == view && constraint.firstAttribute == NSLayoutAttributeHeight && constraint.secondItem == nil) {
            constraint.constant = expectedLabelSize.height;
            break;
        }
    }
}

+ (void)autoHeightWithFrameForView:(UIView *)view{
    //Calculate the expected size based on the font and linebreak mode of your view
    // FLT_MAX here simply means no constraint in height
    CGSize maximumViewSize = CGSizeMake(view.frame.size.width, FLT_MAX);
    CGSize expectedLabelSize = [view sizeThatFits:maximumViewSize];
    [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, expectedLabelSize.height)];
}

+ (void)autoWidthWithConstraintForView:(UIView *)view{
    //Calculate the expected size based on the font and linebreak mode of your label
    // FLT_MAX here simply means no constraint in width
    CGSize maximumViewSize = CGSizeMake(FLT_MAX, view.frame.size.height);
    
    //fix the layout in lower versions
    [view sizeToFit];
    
    CGSize expectedLabelSize = [view sizeThatFits:maximumViewSize];
    
    //add the new width constraint to the view
    for (NSLayoutConstraint *constraint in view.constraints) {
        if (constraint.firstItem == view && constraint.firstAttribute == NSLayoutAttributeWidth && constraint.secondItem == nil) {
            constraint.constant = expectedLabelSize.width;
            break;
        }
    }
}

@end
