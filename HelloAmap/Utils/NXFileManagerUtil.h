//
//  NXFileManagerUtil.h
//  HuoBan
//
//  Created by ningxia on 14-3-13.
//  Copyright (c) 2014年 NingXia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXFileManagerUtil : NSObject

+ (NXFileManagerUtil *)sharedInstance;

- (NSString *)avatarImagePath;

- (NSString *)chatImagePath;

- (NSString *)itemHtmlCachePath;

@end
