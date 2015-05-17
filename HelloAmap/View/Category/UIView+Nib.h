//
//  UIView+NibRecycle.h
//  NingXia inc
//
//  Created by ningxia on 14/10/31.
//  Copyright (c) 2014年 NingXia inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Nib)
+(instancetype) createViewFromNibByCode;  //直接创建UIView，纯代码重用，需要利用frame定位并转屏控制
+(UINib *) createNibFromNib;   //获取Nib文件，TableViewCell专用

-(void) storyBoardImportNibLoadNib; //storyBoard中引用自定义View时，需要将这个view定义为xib的file's owner，然后内部属性包含view指向xib的view。然后将这个view addSubview到file's owner本身，并且保证这个file's owner是继承于UIView等UI组件
@end
