//
//  UIImage+Capture.h
//  QEZB
//
//  Created by 张慈航 on 16/7/26.
//  Copyright © 2016年 zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Capture)

/**
 *  截取全屏幕
 *
 *  @return 返回截取后的image
 */
+ (UIImage *)imageCaptureTheFullScreen;

/**
 *  截取屏幕
 *
 *  @param view 截取屏幕的view
 *
 *  @return 返回截取后的image
 */
+ (UIImage *)imageCaptureWithView:(UIView *)view;

/**
 *  截取屏幕
 *
 *  @param view  截取屏幕的view
 *  @param scale 截取屏幕的比例
 *
 *  @return 返回截取后的image
 */
+ (UIImage *)imageCaptureWithView:(UIView *)view scale:(CGFloat)scale;

/**
 *  截屏并添加水印
 *
 *  @param view      截取屏幕的view
 *  @param watermark 水印image
 *  @param rect      水印展示在截屏view的位置
 *
 *  @return 截取后的image
 */
+ (UIImage *)imageCaptureWithView:(UIView *)view watermark:(UIImage *)watermark watermarkRect:(CGRect)rect;


/**
 *  截取当前屏幕
 *
 *  @return NSData *
 */

+ (UIImage *)imagecaptureWithScreenshot;


+ (UIImage *)imagecaptureWithScreenshotWithView:(UIView *)view;

@end
