//
//  UIViewController+StoryBoard.m
//  Huoban
//
//  Created by zhoubo on 15/1/22.
//  Copyright (c) 2015年 huoban. All rights reserved.
//

#import "UIViewController+StoryBoard.h"

@implementation UIViewController (StoryBoard)

+ (id)instantiateViewControllerFromStoryboard:(NSString *)name {
    return [self instantiateViewControllerFromStoryboard:name withIndentifier:NSStringFromClass([self class])];
}

+ (id)instantiateViewControllerFromStoryboard:(NSString *)name withIndentifier:(NSString *)identifier {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:[NSBundle mainBundle]];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

@end
