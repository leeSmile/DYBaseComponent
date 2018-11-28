//
//  UIView+Badge.h
//  Badge
//
//  Created by qie on 16/11/1.
//  Copyright © 2016年 qie. All rights reserved.
//

#import <UIKit/UIKit.h>

//key for associative methods during runtime
static char badgeLabelKey;
static char badgeBgColorKey;
static char badgeFontKey;
static char badgeTextColorKey;
static char badgeAniTypeKey;
static char badgeFrameKey;
static char badgeCenterOffsetKey;
static char badgeMaximumBadgeNumberKey;

typedef NS_ENUM(NSUInteger, WBadgeStyle)
{
    WBadgeStyleRedDot = 0,          /* red dot style */
    WBadgeStyleNumber,              /* badge with number */
    WBadgeStyleNew                  /* badge with a fixed text "new" */
};

@interface UIView (Badge)

@property (nonatomic, strong) UILabel *badge;           /* badge entity, which is adviced not to set manually */
@property (nonatomic, strong) UIFont *badgeFont;		/* [UIFont boldSystemFontOfSize:9] by default if not set */
@property (nonatomic, strong) UIColor *badgeBgColor;    /* red color by default if not set */
@property (nonatomic, strong) UIColor *badgeTextColor;  /* white color by default if not set */
@property (nonatomic, assign) CGRect badgeFrame;        /* we have optimized the badge frame and center. This property is adviced not to set manually */
@property (nonatomic, assign) CGPoint  badgeCenterOffset;
@property (nonatomic, assign) NSInteger badgeMaximumBadgeNumber;

- (void)showBadge;

- (void)showBadgeWithStyle:(WBadgeStyle)style value:(NSInteger)value;

- (void)clearBadge;

@end
