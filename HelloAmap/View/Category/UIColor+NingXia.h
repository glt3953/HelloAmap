//
//  UIColor+NingXia.h
//  NingXia
//
//  Created by ningxia on 15/1/28.
//  Copyright (c) 2015年 NingXia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (NingXia)

+ (UIColor *)nx_colorFromHexString:(NSString *)hexString;

+ (UIColor *)nx_colorFromHexString:(NSString *)hexString alpha:(float)alpha;

+ (UIColor *)nx_colorWithCircleImageByKey:(NSString *)key radius:(CGFloat)radius;

+ (UIColor *)nx_colorWithCircleImageWithColor:(UIColor *)color radius:(CGFloat)radius;

@end
