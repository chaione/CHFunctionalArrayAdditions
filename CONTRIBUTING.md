Contributing
===========

If you want to contribute to ChaiKit, great! However, there are a few guidelines that you need to follow.

* Be aware of the scope of ChaiKit. While this is a collection of different utilities, we want to keep it slim and limited to things that are universally useful in every app. So improvements or additions to Foundation or UIKit that you would use in every app are appropriate. Stand alone UI components or controls are most likely not appropriate.

* New features __must__ have accompanying tests, or your PR will be rejected.

* Methods that take more than one parameter, that could possibly have nil parameters should be prefixed with the nonnull attribute modifier, like so: `- (id)__attribute__((nonnull(2)))foldLeftWithStart:(id)start reduce:(id(^)(id accumulator, id value))block;` <br> This denotes that the second parameter cannot be nil, and will give a warning if you try to call this method with a nil parameter for the second argument. This places the burden on the caller to provider valid arguments, rather than worry about error checking for nil in the implementation.

* Follow the coding style present in the rest of the repository. We will work on a concrete set of coding guidelines, but until then, try not to deviate from the current style.

* Don't commit directly to master. Make a branch with your changes and submit a PR off of that. 

Other than that, improvements and changes are welcome.
