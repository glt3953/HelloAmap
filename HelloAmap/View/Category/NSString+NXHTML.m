//
//  NSString+NXHTML.m
//  NingXia
//
//  Created by ningxia on 15/1/28.
//  Copyright (c) 2015年 NingXia. All rights reserved.
//

#import "NSString+NXHTML.h"

@implementation NSString (NXHTML)

- (NSString *)nx_replacedHTML {
    NSString *result = [self stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    result = [result stringByReplacingOccurrencesOfString:@"\'" withString:@"\\\'"];
    result = [result stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    result = [result stringByReplacingOccurrencesOfString:@"\r" withString:@"\\r"];
    //result = [result stringByReplacingOccurrencesOfString:@"\f" withString:@"\\f"];
    //result = [result stringByReplacingOccurrencesOfString:@"\u2028" withString:@"\\u2028"];
    //result = [result stringByReplacingOccurrencesOfString:@"\u2029" withString:@"\\u2029"];
    
    return result;
}

- (NSString *)nx_unescapeHTML {
    NSString *result = [self stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    result = [result stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    result = [result stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    result = [result stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    result = [result stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    result = [result stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    return result;
}

@end
