<?php

$aliases = [
    Illuminate\Support\Collection::class => Tightenco\Collect\Support\Collection::class,
    Illuminate\Support\Arr::class => Tightenco\Collect\Support\Arr::class,
    Illuminate\Support\Carbon::class => Tightenco\Collect\Support\Carbon::class,
    Illuminate\Support\HigherOrderCollectionProxy::class => Tightenco\Collect\Support\HigherOrderCollectionProxy::class,
    Illuminate\Support\HigherOrderTapProxy::class => Tightenco\Collect\Support\HigherOrderTapProxy::class,
    Illuminate\Support\HtmlString::class => Tightenco\Collect\Support\HtmlString::class,
    Illuminate\Support\Optional::class => Tightenco\Collect\Support\Optional::class,
    Illuminate\Support\Str::class => Tightenco\Collect\Support\Str::class,
    Illuminate\Support\Debug\Dumper::class => Tightenco\Collect\Support\Debug\Dumper::class,
    Illuminate\Support\Debug\HtmlDumper::class => Tightenco\Collect\Support\Debug\HtmlDumper::class,
];

foreach ($aliases as $illuminate => $tighten) {
    if (class_exists($illuminate) && ! interface_exists($illuminate) && ! trait_exists($illuminate)) {
        class_alias($illuminate, $tighten);
    }
}
