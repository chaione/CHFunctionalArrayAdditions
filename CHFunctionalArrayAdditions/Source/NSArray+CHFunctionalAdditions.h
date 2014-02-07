//
//  NSArray+CHFunctionalAdditions.h
//  ChaiOneUtils
//
//  Created by Ben Scheirman on 5/23/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (CHFunctionalAdditions)

/**
 * Applies `block` to each element in the array, then returns a new array.
 * Block cannot return nil, as nil cannot be added to cocoa collections.
 *
 * @param block The function that will be applied to each element in the array.
 * @return A new array with the objects transformed by the block.
 */
- (NSArray *)__attribute__((nonnull(1)))ch_map:(id (^)(id obj))block;

/**
 * Applies `block` to each element in the array, then returns a new array.
 * `block` cannot return nil, as nil cannot be added to cocoa collections.
 * Catches any errors in the block passed to the `catch` param.
 *
 * Useful for operations where you may have an error during enumeration.
 * @code 
 * [filePaths tryMap:^id(NSString *obj, NSError **errorPtr) {
 *      return [NSData dataWithContentsOfFile:obj options:NSDataReadingUncached error:errorPtr];
 * } catch:^void(NSError *error) {
 *      NSLog(@"%@",error);
 * }];
 * @endcode
 *
 * @param block The function that will be applied to each element in the array.
 * @param errorBlock A block that will be called if `errorPtr` is not nil.
 * @return A new array with the objects transformed by the block, or nil if an error was caught.
 */
- (NSArray *)__attribute__((nonnull(1, 2)))ch_tryMap:(id (^)(id, NSError **))block catch:(void (^)(NSError *))errorBlock;

/**
 * Applies `block` to each element in the array, and returns a new array of objects
 * that satisfy the predicate in `block`
 * @param block A predicate function that will be applied to each element in the array.
 * If the function returns YES, that element will be added to the new array, if it returns
 * NO, then that element will be rejected.
 * @return A new array with the objects that satisfied the predicate in `block`.
 */
- (NSArray *)__attribute__((nonnull(1)))ch_filter:(BOOL (^)(id obj))block;

/**
 * Applies a left fold to the array, such that an array of [1,2,3]
 * would have the function in block applied in the following manner:
 * @code block(block(block(start, 1), 2), 3) @endcode
 *
 * @param start The starting value for the fold, used as the accumulator for the first fold
 * @param block The block that combines accumulator and value
 * @return A reduced value
 */
- (id)__attribute__((nonnull(2)))ch_foldLeftWithStart:(id)start reduce:(id (^)(id, id))block;

/**
 * Takes an array and applies the function in zip to objects from both arrays
 * and returns a new array of the objects derived from the zip function.
 * If one array is smaller that the other, the elements in the larger array that
 * are after the last index of the smaller array are discarded.
 *
 * @param array The array that will be zipped with the current array
 * @param zip The function that will be applied to the elements from each array.
 * @return A new array with the elements that are the results of the zip function.
 */
- (NSArray *)__attribute__((nonnull(1, 2)))ch_zipWith:(NSArray *)array zip:(id (^)(id, id))block;
@end
