//
//  UIColor+NXIM.m
//  NingXia
//
//  Created by ningxia on 15/1/28.
//  Copyright (c) 2015年 NingXia. All rights reserved.
//

#import "UIColor+NingXia.h"
#import "UIImage+NingXia.h"

@implementation UIColor (NingXia)

+ (UIColor *)nx_colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

+ (UIColor *)nx_colorFromHexString:(NSString *)hexString alpha:(float)alpha {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:alpha];
}

+ (UIColor *)nx_colorWithCircleImageByKey:(NSString *)key radius:(CGFloat)radius {
    static NSDictionary *colorDictionary = nil;
    if (colorDictionary == nil) {
        // TODO:通过配置文件初始化颜色键值对
        colorDictionary = @{@"a":[self nx_colorFromHexString:@"#4b81ca"],
                            @"b":[self nx_colorFromHexString:@"#38b478"],
                            @"c":[self nx_colorFromHexString:@"#e46933"],
                            @"d":[self nx_colorFromHexString:@"#7badc0"],
                            @"e":[self nx_colorFromHexString:@"#cacf3d"],
                            @"f":[self nx_colorFromHexString:@"#77af4a"],
                            @"S":[self nx_colorFromHexString:@"#ff8400"],
                            @"W":[self nx_colorFromHexString:@"#0658a3"],
                            @"T":[self nx_colorFromHexString:@"#86c927"],
                            @"E":[self nx_colorFromHexString:@"#009cff"]};
    }
    UIColor *color = colorDictionary[key];
    if (color == nil) {
        color = [UIColor whiteColor];
    }
    return [UIColor colorWithPatternImage:[UIImage nx_makeCircleImageWithColor:color radius:radius]];
}

+ (UIColor *)nx_colorWithCircleImageWithColor:(UIColor *)color radius:(CGFloat)radius {
    return [UIColor colorWithPatternImage:[UIImage nx_makeCircleImageWithColor:color radius:radius]];
}

@end
