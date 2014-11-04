//
//  WordWrapper.m
//  WordWrapper
//
//  Created by lihui on 14/10/31.
//  Copyright (c) 2014年 lihui. All rights reserved.
//

#import "WordWrapper.h"

@implementation WordWrapper

+ (NSString*)doWrap:(NSInteger)column string:(NSString *)string {
    NSRange wrapperRange = [string rangeOfString:@" " options:NSBackwardsSearch range:NSMakeRange(0, column)];
    NSInteger wrappedIndex = (wrapperRange.length > 0) ? wrapperRange.location : column;
    
    NSString *stringWapped = [string substringToIndex:wrappedIndex];
    NSString *stringToBeWrapped = [string substringFromIndex:wrappedIndex];
    
    return [[stringWapped stringByAppendingString:@"\n"] stringByAppendingString:[WordWrapper wrap:stringToBeWrapped withColumn:column]];
}

+ (NSString *)wrap:(NSString *)string withColumn:(NSInteger)column {
    NSAssert(column > 0, @"The column should be bigger than 0");
    NSAssert(string.length > 0, @"The length of input should be longer than 0");
    
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if (string.length <= column) {
        return string;
    }
    
    return [self doWrap:column string:string];
}

@end
