//
//  UIImage+Capture.m
//  QEZB
//
//  Created by 张慈航 on 16/7/26.
//  Copyright © 2016年 zhou. All rights reserved.
//

#import "UIImage+Capture.h"

@implementation UIImage (Capture)

#pragma mark - Capture

+ (UIImage *)imageCaptureTheFullScreen {
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    return [self imageCaptureWithView:window];
}

+ (UIImage *)imageCaptureWithView:(UIView *)view {
    return [self imageCaptureWithLayer:view.layer scale:[UIScreen mainScreen].scale];
}

+ (UIImage *)imageCaptureWithView:(UIView *)view scale:(CGFloat)scale {
    return [self imageCaptureWithLayer:view.layer scale:scale];
}

+ (UIImage *)imageCaptureWithLayer:(CALayer *)layer scale:(CGFloat)scale {
    
    UIImage *image = nil;
    CGSize size = layer.bounds.size;
    
    UIGraphicsBeginImageContextWithOptions(size, layer.opaque, scale);
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imagecaptureWithScreenshot {
    
    CGSize  imageSize = [UIScreen mainScreen].bounds.size;
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for(UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, window.center.x, window.center.y);
        CGContextConcatCTM(context, window.transform);
        CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x,  -window.bounds.size.height * window.layer.anchorPoint.y);
        [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  image;
}

+ (UIImage *)imagecaptureWithScreenshotWithView:(UIView *)view {
    
    CGSize  imageSize = [UIScreen mainScreen].bounds.size;
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for(UIView *tempView in view.subviews)
    {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, tempView.center.x, tempView.center.y);
        CGContextConcatCTM(context, tempView.transform);
        CGContextTranslateCTM(context, -tempView.bounds.size.width * tempView.layer.anchorPoint.x,  -tempView.bounds.size.height * tempView.layer.anchorPoint.y);
        [tempView drawViewHierarchyInRect:tempView.bounds afterScreenUpdates:YES];
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  image;
}


#pragma mark - Watermark Capture

+ (UIImage *)imageCaptureWithView:(UIView *)view watermark:(UIImage *)watermark watermarkRect:(CGRect)rect {
    return [self imageCaptureWithLayer:view.layer watermark:watermark watermarkRect:rect];
}

+ (UIImage *)imageCaptureWithLayer:(CALayer *)layer watermark:(UIImage *)watermark watermarkRect:(CGRect)rect {

    UIImage *image;
    CGSize size = layer.bounds.size;
    
    UIGraphicsBeginImageContextWithOptions(size, layer.opaque, [UIScreen mainScreen].scale);
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    if (watermark) {
        [watermark drawInRect:rect];
    }
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
