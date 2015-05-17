//
//  UIView+NXSetViewValueByTag.m
//  NingXia
//
//  Created by ningxia on 15/1/23.
//  Copyright (c) 2015年 NingXia. All rights reserved.
//

#import "UIView+NXSetViewValueByTag.h"

@implementation UIView (NXSetViewValueByTag)

- (UILabel *)setLabelText:(NSString *)text tag:(NSInteger)tag {
    UILabel *label = (UILabel *)[self viewWithTag:tag];
    NSAssert(label != nil, @"no label with tag=%ld self=%@", (long)tag, self);
    label.text = text;
    return label;
}

- (UIImageView *)setImage:(UIImage *)image tag:(NSInteger)tag {
    UIImageView *imageView = (UIImageView *)[self viewWithTag:tag];
    NSAssert(imageView != nil, @"no imageView with tag=%ld self=%@", (long)tag, self);
    imageView.image = image;
    return imageView;
}

@end
