//
//  UILabel+NingXia.m
//  NingXia
//
//  Created by ningxia on 14-3-26.
//  Copyright (c) 2014年 NingXia. All rights reserved.
//

#import "UILabel+NingXia.h"

@implementation UILabel (NingXia)

+ (UILabel *)createLabelWithFrame:(CGRect)frame fontColor:(UIColor *)color fontSize:(CGFloat)size fontBold:(CGFloat)bold {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:size];
    label.textColor = color;
    [label setLineBreakMode:NSLineBreakByTruncatingTail];
    
    if (bold > 0.f) {
        label.font = [UIFont boldSystemFontOfSize:bold];
    }
    
    return label;
}

@end
