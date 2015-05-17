//
//  UITableView+NXIM.m
//  NingXia
//
//  Created by ningxia on 14-3-24.
//  Copyright (c) 2014年 NingXia. All rights reserved.
//

#import "UITableView+NXIM.h"

@implementation UITableView (NXIM)

- (void)scrollToBottom:(BOOL)animated {

    NSInteger s = [self numberOfSections];
	if (s<1) return;
	NSInteger r = [self numberOfRowsInSection:s-1];
	if (r<1) return;
	NSIndexPath *ip = [NSIndexPath indexPathForRow:r-1 inSection:s-1];
	[self scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionBottom animated:animated];


    /*
    CGFloat yOffset = 0;
    
    if (self.contentSize.height > self.bounds.size.height) {
        yOffset = self.contentSize.height - self.bounds.size.height + self.contentInset.top;
    }
    
    [self setContentOffset:CGPointMake(0, yOffset) animated:animated];
    */
}

@end
