CHFunctionalArrayAdditions
===========

A few functional additions to NSArray such as `ch_map:` and `ch_filter:` that make working with NSArray much simpler and cleaner.

Whats in here?
===========
Functional methods that are missing from foundation collection classes. All of the methods provided give you easy ways to transform and compose arrays, without writing for...each
loops and having to add things to new mutable collections.

Usage
===========
Here are some examples of use cases for the provided methods.
```
NSArray *numbers = @[@1, @2, @3, @4, @5, @6];

NSNumber *reduced = [[[numbers ch_filter:^BOOL(NSNumber *obj) {
      return obj.integerValue % 3 == 0;
   }]ch_map:^id(NSNumber *obj) {
      return @(obj.integerValue * obj.integerValue);
   }]ch_foldLeftWithStart:@0 reduce:^id(NSNumber *start, NSNumber *accumulator) {
      return @(start.integerValue + accumulator.integerValue);
}];
NSLog(@"%@", reduced); // reduced to 45
```

`-ch_filter:` applies a block to each element in the array, and returns a new array consisting of only elements that pass the predicate in the block.

`-ch_map:` applies a given block to each element in the array, added the result of the computation to a new array and returns it, leaving the source array untouched.

`-ch_foldLeftWithStart:reduce:` folds the array in on itself, starting from the left, or the first element, and returns a reduced value.

Also available:

`-ch_tryMap:catch:` The same as `-ch_map:` expect with an error passed into the block, and a block that can be used to handle errors. Can be used as such:
```
[filePaths tryMap:^id(NSString *obj, NSError **errorPtr) {
       return [NSData dataWithContentsOfFile:obj options:NSDataReadingUncached error:errorPtr];
  } catch:^void(NSError *error) {
       NSLog(@"%@",error);
  }];
```
 
 And finally, `-ch_zipWith:zip:` which is functionally the same as `-ch_map:`, except it takes another array in addition to the source array, and combines their elements within the block passed to the `zip` parameter.

Installation
===========
CHFunctionalArrayAdditions uses [cocoapods](http://cocoapods.org), though it requires a few steps since it is using the private [ChaiKit-Specs](https://github.com/chaione/ChaiKit-Specs) repo, so a few additional steps are required to be able to pull it in, which you can find [here](http://guides.cocoapods.org/making/private-cocoapods.html). Once that is done just put `pod 'CHFunctionalArrayAdditions', :head` into your podfile and install like normal. then just `#import <NSArray+CHFunctionalAdditions.h>` wherever you want to use it.

Contributing
===========
Contributions and improvements are welcome. Just fork the project and submit a pull request. Make sure you check out the [contributing document](http://github.com/chaione/CHFunctionalArrayAdditions/blob/master/CONTRIBUTING.md) first.
