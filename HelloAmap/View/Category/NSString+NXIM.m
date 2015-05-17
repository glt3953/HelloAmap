//
//  NSString+NXIM.m
//  NingXia
//
//  Created by ningxia on 14-3-24.
//  Copyright (c) 2014年 NingXia. All rights reserved.
//

#import "NSString+NXIM.h"

@implementation NSString (NXIM)

- (CGSize)messageBoundingRectWithFontSize:(float)fontSize {
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        // NS_AVAILABLE_IOS(7_0)
        return [self boundingRectWithSize:(CGSize){190.0f, 2000.0f} options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    } else {
        // NS_AVAILABLE_IOS(6_0)
        NSAttributedString * attributedContent = [[NSAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
        CGRect contentRect = [attributedContent boundingRectWithSize:(CGSize){190.f, 2000.0f} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        contentRect.size.width += 3;
        return contentRect.size;
    }
}

@end
