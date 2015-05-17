//
//  NXActionSheet.h
//  NingXia
//
//  Created by ningxia on 15/5/6.
//  Copyright (c) 2015年 NingXia. All rights reserved.
//
//  # 弹出阻断式黑色背景自定义ActionSheet
//  # Spring Shadow NXActionSheet

#import <UIKit/UIKit.h>
#import "FXBlurView.h"

@protocol NXActionSheetDelegate;

@interface NXActionSheet : FXBlurView <UIActionSheetDelegate>
@property (weak, nonatomic) id<NXActionSheetDelegate> delegate;
-(void) setTitle:(NSString *) title andIcon:(NSString *) iconString;
-(void) show;   // 显示
-(void) hide;   // 消失
-(void) showNextView:(UIView *) view; //显示下级选择框
@end


@protocol NXActionSheetDelegate <NSObject>
@optional
- (void)willPresent;  // before animation and showing view
- (void)didPresent;  // after animation
- (void)nextViewWillShow:(CGRect) frame;
- (void)nextViewDidShow;
- (void)nextViewWillHide:(CGRect) frame;
- (void)willDismiss;
- (void)didDismiss;
@end