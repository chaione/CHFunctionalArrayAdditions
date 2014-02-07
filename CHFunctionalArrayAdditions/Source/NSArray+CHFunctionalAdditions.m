//
//  NSArray+CHFunctionalAdditions.m
//  ChaiOneUtils
//
//  Created by Ben Scheirman on 5/23/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import "NSArray+CHFunctionalAdditions.h"

@implementation NSArray (CHFunctionalAdditions)

- (NSArray *)ch_map:(id (^)(id obj))block {
    NSMutableArray *projections = [NSMutableArray new];
    for(id obj in self) {
        id val = block(obj);
        [projections addObject:val];
    }

    return [NSArray arrayWithArray:projections];
}

- (NSArray *)ch_tryMap:(id (^)(id, NSError **))block catch:(void (^)(NSError *))errorBlock {
    NSMutableArray *projections = [NSMutableArray new];
    NSError *error = nil;
    for(id obj in self) {
        id val = block(obj, &error);
        if(error) {
            errorBlock(error);
            return nil;
        }
        [projections addObject:val];
    }

    return [NSArray arrayWithArray:projections];
}

- (NSArray *)ch_filter:(BOOL (^)(id obj))block {
    NSMutableArray *subset = [NSMutableArray new];
    for(id obj in self) {
        if(block(obj)) [subset addObject:obj];
    }

    return [NSArray arrayWithArray:subset];
}

- (id)ch_foldLeftWithStart:(id)start reduce:(id (^)(id, id))block {
    for(id object in self) {
        start = block(start, object);
    }

    return start;
}

- (NSArray *)ch_zipWith:(NSArray *)array zip:(id (^)(id, id))block {
    NSInteger minCount = MIN(self.count, array.count);
    NSMutableArray *zippedArray = [NSMutableArray new];

    for(NSUInteger i = 0; i < minCount; i++) {
        id zippedObj = block(self[i], array[i]);
        [zippedArray addObject:zippedObj];
    }

    return [NSArray arrayWithArray:zippedArray];
}
@end
