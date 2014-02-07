Contributing
===========

If you want to contribute to CHFunctionalArrayAdditions, great! However, there are a few guidelines that you need to follow.

* New features __must__ have accompanying tests, or your PR will be rejected.

* Category methods __must__ have the`ch_` prefix, or your PR will be rejected.

* Methods that take more than one parameter, that could possibly have nil parameters should be prefixed with the nonnull attribute modifier, like so: `- (id)__attribute__((nonnull(2)))foldLeftWithStart:(id)start reduce:(id(^)(id accumulator, id value))block;` <br> This denotes that the second parameter cannot be nil, and will give a warning if you try to call this method with a nil parameter for the second argument. This places the burden on the caller to provider valid arguments, rather than worry about error checking for nil in the implementation.

* Follow the coding style present in the rest of the repository.

* Don't commit directly to master. Make a branch with your changes and submit a PR off of that. 

Other than that, improvements and changes are welcome.
