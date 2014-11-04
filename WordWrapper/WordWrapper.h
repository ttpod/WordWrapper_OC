//
//  WordWrapper.h
//  WordWrapper
//
//  Created by lihui on 14/10/31.
//  Copyright (c) 2014年 lihui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordWrapper : NSObject

+ (NSString *)wrap:(NSString *)string withColumn:(NSInteger)column;

@end
