# Collect - Illuminate Collections

Import [Laravel's Collections](https://laravel.com/docs/collections) into non-Laravel packages easily, without needing to require the entire `Illuminate\Support` package. ([Why not pull `Illuminate\Support` in framework-agnostic packages](http://mattallan.org/2016/dont-use-illuminate-support/))

Written by Taylor Otwell as a part of Laravel's [Illuminate/Support](https://github.com/illuminate/support) package, Collect is just the code from Support needed in order to use Collections on their own.

Lovingly split by [Tighten Co.](http://tighten.co/), with a kick in the butt to finally do it from [@assertchris](https://github.com/assertchris).

## FAQ
 - **Will this develop independently from Illuminate's Collections?** No. Right now it's split manually, but the goal is for it shortly to be split automatically to keep it in sync with Laravel's Collections, even mirroring the release numbers.
 - **Why isn't this just under the Illuminate namespace?** Because that would require adding a lot of complexity to Illuminate\Support's internal structure. One day Taylor may choose to do that, but right now he hasn't. If he does, we'll deprecate this package and point to the core version.
 - **Why not just use an array?** What a great question. [Here's the answer.](http://adamwathan.me/refactoring-to-collections/)
