//
//  NSString+NXHTML.h
//  NingXia
//
//  Created by ningxia on 15/1/28.
//  Copyright (c) 2015年 NingXia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NXHTML)

- (NSString *)nx_replacedHTML;

- (NSString *)nx_unescapeHTML;

@end
