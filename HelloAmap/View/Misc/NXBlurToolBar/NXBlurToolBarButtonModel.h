//
//  NXBlurToolBarButtonModel.h
//  NingXia
//
//  Created by ningxia on 15/5/5.
//  Copyright (c) 2015年 NingXia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXBlurToolBarButtonModel : NSObject
@property (nonatomic, strong) NSString * buttonIcon;
@property (nonatomic, strong) NSString * buttonAction;
@property (nonatomic, weak) id buttonTarget;
@end
