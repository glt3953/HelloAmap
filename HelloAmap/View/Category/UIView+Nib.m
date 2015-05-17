//
//  UIView+NibRecycle.m
//  NingXia inc.
//
//  Created by ningxia on 14/10/31.
//  Copyright (c) 2014年 NingXia inc. All rights reserved.
//

#import "UIView+Nib.h"

@implementation UIView (Nib)
+ (instancetype)createViewFromNibByCode {
    NSString * nibName = NSStringFromClass(self.class);
    NSArray * nibs = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    if ([nibs count] > 0) {
        for (UIView * view in nibs) {
            if ([NSStringFromClass([view class]) isEqual:nibName]) {
                return view;
            }
        }
    }
//    debug(@"Your %@ can't be found!", nibName);
    return nil;
}

+ (UINib *)createNibFromNib {
    return [UINib nibWithNibName:NSStringFromClass(self.class) bundle:nil];
}

- (void)storyBoardImportNibLoadNib{
    NSString * nibName = NSStringFromClass(self.class);
    [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
}
@end
