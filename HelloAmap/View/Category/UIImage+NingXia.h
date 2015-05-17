//
//  UIImage+NingXia.h
//  NingXia
//
//  Created by ningxia on 14-3-5.
//  Copyright (c) 2014年 NingXia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NingXia)

- (UIImage *)nx_makeContactAvatar;

+ (UIImage *)nx_makeGroupAvatarWithImages:(NSArray *)images;

+ (CGSize)nx_getThumbnailSizeFromSize:(CGSize)imageSize;
+ (UIImage *)nx_makeThumbnailFromImage:(NSData *)data;

+ (UIImage*)nx_maskImage:(UIImage *)image withMask:(UIImage *)maskImage;

+ (UIImage *)nx_makeImageFromText:(NSString *)text font:(UIFont *)font color:(UIColor *)color;

+ (UIImage *)nx_makeImageFromText:(NSString *)text font:(UIFont *)font color:(UIColor *)color bgColor:(UIColor *)bgColor radius:(CGFloat)radius;

+ (UIImage *)nx_makeCircleImageWithColor:(UIColor *)color radius:(CGFloat)radius;

+ (UIImage *)decodedImageWithImage:(UIImage *)image;

+ (UIImage*)blur:(UIImage*)theImage;

+ (UIImage*)scaleIfNeeded:(CGImageRef)cgimg;

+ (UIImage*)reOrientIfNeeded:(UIImage*)theImage;

- (UIImage *)nx_resizedImage:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;

@end
