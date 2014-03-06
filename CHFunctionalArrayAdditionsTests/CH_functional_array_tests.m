//
//  CH_functional_array_tests.m
//  ChaiKit-ios
//
//  Created by Terry Lewis II on 1/24/14.
//  Copyright (c) 2014 Terry Lewis. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+CHFunctionalAdditions.h"

@interface CH_functional_array_tests : XCTestCase

@end

@implementation CH_functional_array_tests

- (void)setUp {
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)test_map_function {
    NSArray *nums = @[@1, @2, @3];
   NSArray *newNums = [nums ch_map:^id(NSNumber *obj) {
       return @(obj.integerValue * obj.integerValue);
   }];
    NSArray *finalArray = @[@1, @4, @9];
    XCTAssertEqualObjects(newNums, finalArray, @"Arrays should be equal.");
}

- (void)test_filter_function {
    NSArray *nums = @[@1, @2, @3, @4];
    NSArray *newNums = [nums ch_filter:^BOOL(NSNumber *obj) {
        return obj.integerValue % 2 == 0;
    }];
    NSArray *finalArray = @[@2, @4];
    XCTAssertEqualObjects(newNums, finalArray, @"Arrays should be equal.");
}

- (void)test_fold_left_function {
    NSArray *nums = @[@1, @2, @3];
    NSNumber *number = [nums ch_foldLeftWithStart:@0 reduce:^id(NSNumber *accumulator, NSNumber *value) {
        return @(accumulator.integerValue + value.integerValue);
    }];
    XCTAssertEqualObjects(number, @6, @"Should be equal.");
}

- (void)test_zip_with_function {
    NSArray *nums = @[@1, @2, @3, @4];
    NSArray *moreNums = @[@5, @6, @7];
    NSArray *newNums = [nums ch_zipWith:moreNums zip:^id(NSNumber *first, NSNumber *second) {
        return @(first.integerValue + second.integerValue);
    }];
    NSArray *finalArray = @[@6, @8, @10];
    XCTAssertEqualObjects(newNums, finalArray, @"Arrays should be equal.");
}

- (void)test_try_map_function {
    NSArray *badFilePaths = @[@"not a path", @"bad path", @"try again"];

    NSArray *dataFromPaths = [badFilePaths ch_tryMap:^id(id obj, NSError **errorPtr) {
        return [NSData dataWithContentsOfFile:obj options:NSDataReadingMapped error:errorPtr];
    }                                          catch:^(NSError *error) {
        XCTAssertNotNil(error, @"Error should not be nil");
    }];
    XCTAssertNil(dataFromPaths, @"Should be nil");
}

- (void)test_flatten {
    NSArray *flat = @[@[@1,@[@2,@[@3,@[@4,@[@5], @6], @7], @8], @9], @10].ch_flatten;
    NSArray *final = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
    XCTAssertEqualObjects(flat, final, @"should be equal");
    
    NSArray *alreadyFlat = @[@1, @2, @3, @4, @5].ch_flatten;
    NSArray *normal = @[@1, @2, @3, @4, @5];
    XCTAssertEqualObjects(alreadyFlat, normal, @"should be no change");
}
@end

