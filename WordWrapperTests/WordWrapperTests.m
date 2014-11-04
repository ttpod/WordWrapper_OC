//
//  WordWrapperTests.m
//  WordWrapperTests
//
//  Created by lihui on 14/10/31.
//  Copyright (c) 2014年 lihui. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "WordWrapper.h"

@interface WordWrapperTests : XCTestCase

@end

@implementation WordWrapperTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_one_word_shorter_than_column_number_should_not_wrap {
    XCTAssertEqualObjects(@"word", [WordWrapper wrap:@"word" withColumn:5]);
}

- (void)test_one_word_equals_to_column_number_should_not_wrap {
    XCTAssertEqualObjects(@"word", [WordWrapper wrap:@"word" withColumn:4]);
}

- (void)test_one_word_longer_than_column_number_should_wrap {
    XCTAssertEqualObjects(@"wo\nrd", [WordWrapper wrap:@"word" withColumn:2]);
}

- (void)test_nil_should_throw_exception {
    XCTAssertThrows([WordWrapper wrap:nil withColumn:5]);
}

- (void)test_column_number_shorter_than_zero_should_throw_exception {
    XCTAssertThrows([WordWrapper wrap:@"word" withColumn:-1]);
}

- (void)test_word_with_two_spaces_should_wrap {
    XCTAssertEqualObjects(@"word\nword", [WordWrapper wrap:@"word  word" withColumn:4]);
}

- (void)test_two_word_should_wrap {
    XCTAssertEqualObjects(@"word\nword", [WordWrapper wrap:@"word word" withColumn:6]);
}

- (void)test_separate_by_word_boundary_should_wrap {
    XCTAssertEqualObjects(@"word word\nword", [WordWrapper wrap:@"word word word" withColumn:11]);
}

- (void)test_separate_by_word_boundary_should_wrap1 {
    XCTAssertEqualObjects(@"wosdf\nrd\nword\nword", [WordWrapper wrap:@"wosdfrd word word" withColumn:5]);
}



@end
