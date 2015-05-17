//
//  NXActionSheet.m
//  NingXia
//
//  Created by ningxia on 15/5/6.
//  Copyright (c) 2015年 NingXia. All rights reserved.
//

#import "NXActionSheet.h"
#import "UIColor+NingXia.h"

const float NXActionSheetBodyBoxOffset = 30.0f;
const float NXActionSheetShadownHeight = 200.0f;
const float NXActionSheetBoayTitleBarHeight = 50.0f;

@interface NXActionSheet()
@property (weak, nonatomic) IBOutlet UIView * backgroundView;
@property (weak, nonatomic) IBOutlet UIView * bodyBox;

//@property (strong, nonatomic) UIView * titleBox;
@property (weak, nonatomic) IBOutlet UILabel * titleIcon;
@property (weak, nonatomic) IBOutlet UILabel * titleLabel;
@property (weak, nonatomic) IBOutlet UIButton * rightButton;
@end

@implementation NXActionSheet

-(void) awakeFromNib {
    [self setDynamic:NO];
    [self setBlurEnabled:YES];
    [self setBlurRadius:10];
    [self setTintColor:[UIColor blackColor]];
    [self tapGesture];
}

-(void) setTitle:(NSString *) title andIcon:(NSString *) iconString {
    [self.titleIcon setText:iconString];
    [self.titleLabel setText:title];
    [self.rightButton addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
}

-(void) show {
    [self animationShow];
    [self showBodyBox];
}

-(void) showBodyBox {
    CGRect frame = self.frame;
    self.bodyBox.frame = (CGRect) {0, frame.size.height, self.bodyBox.frame.size};
    [UIView animateWithDuration:0.5f delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
        self.bodyBox.frame = (CGRect) {0, frame.size.height - (self.bodyBox.frame.size.height + NXActionSheetBodyBoxOffset * 2), self.bodyBox.frame.size};
    } completion:^(BOOL finished) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(didPresent)]) {
            [self.delegate didPresent];
        }
        self.bodyBox.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
        self.bodyBox.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
        self.bodyBox.layer.shadowOpacity = 0.3;//阴影透明度，默认0
        self.bodyBox.layer.shadowRadius = 3;//阴影半径，默认3
        //路径阴影
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        float width = self.bodyBox.bounds.size.width;
        float height = self.bodyBox.bounds.size.height;
        float x = self.bodyBox.bounds.origin.x;
        float y = self.bodyBox.bounds.origin.y;
        float addWH = 1;
        
        CGPoint topLeft      = self.bodyBox.bounds.origin;
        CGPoint topMiddle = CGPointMake(x+(width/2),y-addWH);
        CGPoint topRight     = CGPointMake(x+width,y);
        
        
        CGPoint leftMiddle = CGPointMake(x-addWH,y+(height/2));
        
        [path moveToPoint:topLeft];
        //添加四个二元曲线
        [path addQuadCurveToPoint:topRight
                     controlPoint:topMiddle];
        [path addQuadCurveToPoint:topLeft
                     controlPoint:leftMiddle];
        //设置阴影路径  
        self.bodyBox.layer.shadowPath = path.CGPath;
    }];
}

- (void)animationShow {
    if (self.delegate && [self.delegate respondsToSelector:@selector(willPresent)]) {
        [self.delegate willPresent];
    }
    self.alpha = 0.0f;
//    [App.window addSubview:self];
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
//    NSLayoutConstraint * cleft = [NSLayoutConstraint constraintWithItem:App.window attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f];
//    [App.window addConstraint:cleft];
//    
//    NSLayoutConstraint * cright = [NSLayoutConstraint constraintWithItem:App.window attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f];
//    [App.window addConstraint:cright];
    
//    NSLayoutConstraint * ctop = [NSLayoutConstraint constraintWithItem:App.window attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f];
//    [App.window addConstraint:ctop];
//    
//    NSLayoutConstraint * cbottom = [NSLayoutConstraint constraintWithItem:App.window attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f];
//    [App.window addConstraint:cbottom];
    
    [UIView animateWithDuration:0.2f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.alpha = 1.0f;
    } completion:nil];
}

-(void) hide {
    [UIView animateWithDuration:0.15f delay:0 options:0 animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void) tapGesture {
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [self.backgroundView addGestureRecognizer:tap];
}

-(void) showNextView:(UIView *) view {
    UIView * viewTmp = [[UIView alloc] initWithFrame:(CGRect) {self.bodyBox.frame.size.width, 50, self.bodyBox.frame.size.width, self.bodyBox.frame.size.height - NXActionSheetBoayTitleBarHeight - NXActionSheetBodyBoxOffset - 30}];
    [viewTmp setBackgroundColor:[UIColor redColor]];
    [self.bodyBox addSubview:viewTmp];
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        viewTmp.frame = (CGRect) {0, NXActionSheetBoayTitleBarHeight, viewTmp.frame.size};
    } completion:^(BOOL finished) {
        
    }];
}



@end
