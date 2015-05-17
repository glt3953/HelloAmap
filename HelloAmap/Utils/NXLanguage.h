//
//  NXLanguage.h
//  NingXia
//
//  Created by ningxia on 13-12-19.
//  Copyright (c) 2013年 NingXia. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ALPHA	@"ABCDEFGHIJKLMNOPQRSTUVWXYZ#"

@interface NXLanguage : NSObject

+ (char)pinyinFirstLetter:(unichar)character;

+ (NSString *)pinyinCapitaledString:(NSString *)aString;

@end
