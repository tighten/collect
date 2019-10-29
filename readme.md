[![Travis Status for tightenco/collect](https://travis-ci.org/tightenco/collect.svg?branch=laravel-6-ongoing)](https://travis-ci.org/tightenco/collect)

![](https://raw.githubusercontent.com/tightenco/collect/master/collect-logo.png)

# Collect - Illuminate Collections

Import [Laravel's Collections](https://laravel.com/docs/collections) into non-Laravel packages easily, without needing to require the entire `Illuminate\Support` package. ([Why not pull `Illuminate\Support` in framework-agnostic packages](https://yuloh.github.io/2016/dont-use-illuminate-support/))

Written by Taylor Otwell as a part of Laravel's [Illuminate/Support](https://github.com/illuminate/support) package, Collect is just the code from Support needed in order to use Collections on their own.

Lovingly split by Matt Stauffer for [Tighten Co.](https://tighten.co/), with a kick in the butt to finally do it from [@assertchris](https://github.com/assertchris).

## Installation

With [Composer](https://getcomposer.org):

```bash
composer require tightenco/collect
```


## FAQ
 - **Will this develop independently from Illuminate's Collections?**  
    No. Right now it's split manually, but the goal is for it shortly to be split automatically to keep it in sync with Laravel's Collections, even mirroring the release numbers.
 - **Why is the package `tightenco/collect` instead of `illuminate/collect`?**  
    It's not an official Laravel package so we don't want to use the Packagist namespace reserved by Laravel packages. One day `Collection` may be extracted from `illuminate/support` to a new package. If so, we'll deprecate this package and point to the core version.
 - **Why not just use an array?**  
    What a great question. [Tighten alum Adam Wathan has a book about that.](https://adamwathan.me/refactoring-to-collections/)

## License

The Laravel framework is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT). Collect consists almost entirely of Laravel source code, so maintains the same license.
