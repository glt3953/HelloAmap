//
//  NXPaintView.m
//  NingXia
//
//  Created by ningxia on 14-3-5.
//  Copyright (c) 2014年 NingXia. All rights reserved.
//

#import "NXPaintView.h"

@implementation NXPaintView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* selectedTextBackgroundColor = [UIColor colorWithRed: 0.71 green: 0.835 blue: 1 alpha: 1];
    UIColor* color = [UIColor colorWithRed: 1 green: 0.604 blue: 0.503 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.617 green: 0.981 blue: 0.326 alpha: 1];
    UIColor* gradient2Color = [UIColor colorWithRed: 0.579 green: 0.128 blue: 0.573 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)[UIColor blackColor].CGColor,
                               (id)[UIColor colorWithRed: 0.345 green: 0.561 blue: 0.171 alpha: 1].CGColor,
                               (id)gradientColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.46, 0.97};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    NSArray* gradient2Colors = [NSArray arrayWithObjects:
                                (id)gradient2Color.CGColor,
                                (id)[UIColor whiteColor].CGColor, nil];
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    
    //// Shadow Declarations
    UIColor* shadow = selectedTextBackgroundColor;
    CGSize shadowOffset = CGSizeMake(2.1, -2.1);
    CGFloat shadowBlurRadius = 4.5;
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(172.5, 311.5, 55, 58)];
    CGContextSaveGState(context);
    [ovalPath addClip];
    //CGContextDrawLinearGradient(context, gradient, CGPointMake(200, 311.5), CGPointMake(200, 369.5), 0);
    UIImage *image = [UIImage imageNamed:@"u498"];
    //CGContextDrawImage(context, CGRectMake(172.5, 311.5, 55, 58), image.CGImage);
    [image drawInRect:CGRectMake(172.5, 311.5, 55, 58)];
    CGContextRestoreGState(context);
    [gradientColor setStroke];
    ovalPath.lineWidth = 1;
    [ovalPath stroke];
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(44.5, 228.5, 60, 44)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [color setFill];
    [rectanglePath fill];
    CGContextRestoreGState(context);
    
    [[UIColor cyanColor] setStroke];
    rectanglePath.lineWidth = 1;
    [rectanglePath stroke];
    
    
    //// Star Drawing
    UIBezierPath* starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint: CGPointMake(120.5, 272.5)];
    [starPath addLineToPoint: CGPointMake(101.46, 301.06)];
    [starPath addLineToPoint: CGPointMake(69.14, 310.85)];
    [starPath addLineToPoint: CGPointMake(89.69, 338.29)];
    [starPath addLineToPoint: CGPointMake(88.76, 372.9)];
    [starPath addLineToPoint: CGPointMake(120.5, 361.3)];
    [starPath addLineToPoint: CGPointMake(152.24, 372.9)];
    [starPath addLineToPoint: CGPointMake(151.31, 338.29)];
    [starPath addLineToPoint: CGPointMake(171.86, 310.85)];
    [starPath addLineToPoint: CGPointMake(139.54, 301.06)];
    [starPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    CGContextBeginTransparencyLayer(context, NULL);
    [starPath addClip];
    CGContextDrawLinearGradient(context, gradient2, CGPointMake(120.5, 272.5), CGPointMake(120.5, 372.9), 0);
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [[UIColor cyanColor] setStroke];
    starPath.lineWidth = 1;
    [starPath stroke];
    CGContextRestoreGState(context);
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(227.74, 239)];
    [bezierPath addCurveToPoint: CGPointMake(275.39, 249.8) controlPoint1: CGPointMake(280.49, 249.8) controlPoint2: CGPointMake(275.39, 249.8)];
    [bezierPath addLineToPoint: CGPointMake(289, 303.8)];
    [bezierPath addLineToPoint: CGPointMake(246.46, 320)];
    [bezierPath addLineToPoint: CGPointMake(205.61, 294.8)];
    [bezierPath addLineToPoint: CGPointMake(192, 260.6)];
    [bezierPath addLineToPoint: CGPointMake(205.61, 239)];
    CGContextSaveGState(context);
    [bezierPath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(240.5, 239), CGPointMake(240.5, 320), 0);
    CGContextRestoreGState(context);
    
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(192.5, 383.5, 108, 62) cornerRadius: 4];
    [[UIColor blueColor] setFill];
    [roundedRectanglePath fill];
    [[UIColor blackColor] setStroke];
    roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];
    
    
    //// Polygon Drawing
    UIBezierPath* polygonPath = [UIBezierPath bezierPath];
    [polygonPath moveToPoint: CGPointMake(66.5, 369.5)];
    [polygonPath addLineToPoint: CGPointMake(15.14, 398.52)];
    [polygonPath addLineToPoint: CGPointMake(34.76, 445.48)];
    [polygonPath addLineToPoint: CGPointMake(98.24, 445.48)];
    [polygonPath addLineToPoint: CGPointMake(117.86, 398.52)];
    [polygonPath closePath];
    [gradientColor setFill];
    [polygonPath fill];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [[UIColor blackColor] setStroke];
    polygonPath.lineWidth = 4.5;
    CGFloat polygonPattern[] = {4, 4, 4, 4};
    [polygonPath setLineDash: polygonPattern count: 4 phase: 1];
    [polygonPath stroke];
    CGContextRestoreGState(context);
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGGradientRelease(gradient2);
    CGColorSpaceRelease(colorSpace);
}

@end
