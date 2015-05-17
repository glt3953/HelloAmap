//
//  NXBlurToolBar.m
//  NingXia
//
//  Created by ningxia on 15/5/4.
//  Copyright (c) 2015年 NingXia. All rights reserved.
//

#import "NXBlurToolBar.h"
#import "FXBlurView.h"
#import "UIView+Nib.h"
#import "UIImage+NingXia.h"
#import "UIColor+NingXia.h"
#import "NXUtil.h"

@interface NXBlurToolBar()

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (strong, nonatomic) NSArray * buttons;
@property (weak, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIView *blurBackground;
@end

@implementation NXBlurToolBar
-(void) awakeFromNib {
    [self storyBoardImportNibLoadNib];
    [self setBlurRadius:20];
    [self setDynamic:YES];
    [self setTintColor:[UIColor clearColor]];
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.view];
    
    NSLayoutConstraint * cleft = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f];
    [self addConstraint:cleft];
    
    NSLayoutConstraint * cright = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f];
    [self addConstraint:cright];
    
    NSLayoutConstraint * ctop = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f];
    [self addConstraint:ctop];
    
    NSLayoutConstraint * cbottom = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f];
    [self addConstraint:cbottom];
    
    self.buttons = [NSArray arrayWithObjects:self.button1, self.button2, self.button3, self.button4, nil];
    [self setButtonsStyle];
    [self border];
}

-(void) setButtonsStyle {
    UIImage * selectedBackgroundImage = [UIImage nx_makeCircleImageWithColor:[UIColor nx_colorFromHexString:@"#4A90E2"] radius:18];
    [self.buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton * button = self.buttons[idx];
        [button setBackgroundImage:selectedBackgroundImage forState:UIControlStateSelected];
        [button setBackgroundImage:selectedBackgroundImage forState:UIControlStateHighlighted];
    }];
}

-(void) showButtonsByConfigs:(NSArray *) configs {
    if ([configs count] > 0) {
        [self.buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            __weak UIButton * button = self.buttons[idx];
            @try {
                NXBlurToolBarButtonModel * model = configs[idx];
                [button setTitle:model.buttonIcon forState:UIControlStateNormal];
                if (model.buttonAction != nil && model.buttonTarget != nil) {
                    SEL selector = NSSelectorFromString(model.buttonAction);
                    [button addTarget:model.buttonTarget action:selector forControlEvents:UIControlEventTouchUpInside];
                }
            }
            @catch (NSException *exception) {
                NSLog(@"error : %@", exception);
            }
            @finally {
                
            }
        }];
    }
}

-(void) viewWillAppear {
    [self.blurBackground setAlpha:0.0f];
}

-(void) viewWillDisAppear {
    [self.blurBackground setAlpha:0.9f];
}

-(void) border {
    self.layer.borderColor = [UIColor nx_colorFromHexString:@"#eeeeee"].CGColor;
    if([NXUtil systemVersion] < 8.0) {
        self.layer.borderWidth = 0.5f;
    } else {
        self.layer.borderWidth = 0.2f;
    }
}
@end
