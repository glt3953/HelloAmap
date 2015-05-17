//
//  UIView+NXSetViewValueByTag.h
//  NingXia
//
//  Created by ningxia on 15/1/23.
//  Copyright (c) 2015年 NingXia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (NXSetViewValueByTag)

- (UILabel *)setLabelText:(NSString *)text tag:(NSInteger)tag;
- (UIImageView *)setImage:(UIImage *)image tag:(NSInteger)tag;

@end
