//
//  UIViewController+StoryBoard.h
//  Huoban
//
//  Created by zhoubo on 15/1/22.
//  Copyright (c) 2015年 huoban. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * @class UIViewController (StoryBoard)
 *
 * @brief
 *
 * TODO: 优化：去掉Storyboard name，减少使用难度
 */
@interface UIViewController (StoryBoard)

+ (id)instantiateViewControllerFromStoryboard:(NSString *)name;

+ (id)instantiateViewControllerFromStoryboard:(NSString *)name withIndentifier:(NSString *)identifier;

@end
