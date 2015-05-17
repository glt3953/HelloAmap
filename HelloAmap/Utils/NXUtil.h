//
//  NXUtil.h
//  NingXia
//
//  Created by ningxia on 14-5-21.
//  Copyright (c) 2014年 NingXia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXUtil : NSObject

+ (NSString *)iconCodeByInteger:(NSInteger)value;

#if TARGET_OS_IPHONE
+ (float)systemVersion;
#endif

@end
