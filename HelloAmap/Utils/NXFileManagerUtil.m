//
//  NXFileManagerUtil.m
//  HuoBan
//
//  Created by ningxia on 14-3-13.
//  Copyright (c) 2014年 NingXia. All rights reserved.
//

#import "NXFileManagerUtil.h"

static NXFileManagerUtil * sharedInstance = nil;

@implementation NXFileManagerUtil {
    NSString *avatarImagePathCache;
    NSString *chatImagePathCache;
    NSString *itemHtmlCachePathCache;
}

+ (NXFileManagerUtil *)sharedInstance {
    if (sharedInstance != nil) {
        return sharedInstance;
    }
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[NXFileManagerUtil alloc] init];
        }
    }
    return sharedInstance;
}

- (NSString *)avatarImagePath {
    if (avatarImagePathCache == nil) {
        avatarImagePathCache = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"Avatar"];
        [[NSFileManager defaultManager] createDirectoryAtPath:avatarImagePathCache withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return avatarImagePathCache;
}

- (NSString *)chatImagePath {
    if (chatImagePathCache != nil) {
        return chatImagePathCache;
    }
    chatImagePathCache = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"chatImage"];
    [[NSFileManager defaultManager] createDirectoryAtPath:chatImagePathCache withIntermediateDirectories:YES attributes:nil error:nil];
    return chatImagePathCache;
}

- (NSString *)itemHtmlCachePath {
    if (itemHtmlCachePathCache != nil) {
        return itemHtmlCachePathCache;
    }
    itemHtmlCachePathCache = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"itemCache"];
    [[NSFileManager defaultManager] createDirectoryAtPath:itemHtmlCachePathCache withIntermediateDirectories:YES attributes:nil error:nil];
    return itemHtmlCachePathCache;
}

@end
