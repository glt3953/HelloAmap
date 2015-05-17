    //
//  NXBadgeLabel.m
//  NingXia
//
//  Created by ningxia on 13-12-13.
//  Copyright (c) 2013年 NingXia. All rights reserved.
//

#import "NXBadgeLabel.h"

@interface NXBadgeLabel ()
{
    
}

@property (nonatomic, assign) CGRect textRect;
@property (nonatomic, assign) CGRect badgeRect;

@end

@implementation NXBadgeLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    [self setBackgroundColor:[UIColor clearColor]];
    return self;
}

- (void)updateLayout:(CGRect)rect
{
    CGPoint centerPoint = CGPointMake(rect.origin.x + rect.size.width / 2, rect.origin.y + rect.size.height / 2);
    CGSize textSize = [[self text] sizeWithFont:self.font];
    self.badgeRect = CGRectMake(centerPoint.x - textSize.width/2 - 4, centerPoint.y - textSize.height/2, textSize.width+8, textSize.height);
    self.textRect = CGRectMake(centerPoint.x - textSize.width/2, centerPoint.y - textSize.height/2, textSize.width, textSize.height);
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self updateLayout:self.bounds];
    CGPoint centerPoint = CGPointMake(self.bounds.origin.x + self.bounds.size.width / 2, self.bounds.origin.y + self.bounds.size.height / 2);
    if (text.length > 0) {
        CGSize textSize = [[self text] sizeWithFont:self.font];
        self.badgeRect = CGRectMake(centerPoint.x - textSize.width/2 - 4, centerPoint.y - textSize.height/2, textSize.width+8, textSize.height);
        self.textRect = CGRectMake(centerPoint.x - textSize.width/2, centerPoint.y - textSize.height/2, textSize.width, textSize.height);
    } else {
        self.badgeRect = CGRectMake(centerPoint.x - 3, centerPoint.y - 3, 12, 12);
    }
}

- (void)drawRect:(CGRect)rect
{
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:self.badgeRect cornerRadius:self.badgeRect.size.height / 2];
    [[UIColor redColor] setFill];
    [roundedRectanglePath fill];
    if (self.text.length > 0) {
        [self.textColor setFill];
        [self.text drawInRect:self.textRect withFont:self.font lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentCenter];
        
    }
}

@end
