//
//  NXActionSheetSubTitle.m
//  NingXia
//
//  Created by ningxia on 15/5/15.
//  Copyright (c) 2015年 NingXia. All rights reserved.
//

#import "NXActionSheetSubTitle.h"

@interface NXActionSheetSubTitle()
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end

@implementation NXActionSheetSubTitle

-(void) awakeFromNib {
    [self.backButton setTitle:@"\ue66c" forState:UIControlStateNormal];
}

@end
