//
//  NXUtil.m
//  NingXia
//
//  Created by ningxia on 14-5-21.
//  Copyright (c) 2014年 NingXia. All rights reserved.
//

#import "NXUtil.h"

@implementation NXUtil

+ (NSString *)iconCodeByInteger:(NSInteger)value {
    NSInteger appIconId = 1536 + value;
    NSString *unicodeStr = [NSString stringWithFormat:@"\"\\Ue%lx\"", (long)appIconId];
    NSData *tempData = [unicodeStr dataUsingEncoding:NSUTF8StringEncoding];
    return [NSPropertyListSerialization propertyListFromData:tempData
                                            mutabilityOption:NSPropertyListImmutable
                                                      format:NULL
                                            errorDescription:NULL];
}

#if TARGET_OS_IPHONE

+ (float)systemVersion {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

#endif

@end
