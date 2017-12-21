<?php

$aliases = [
    Illuminate\Support\Collection::class => Tightenco\Support\Collection::class,
    Illuminate\Support\Arr::class => Tightenco\Support\Arr::class,
    Illuminate\Support\Carbon::class => Tightenco\Support\Carbon::class,
    Illuminate\Support\HigherOrderCollectionProxy::class => Tightenco\Support\HigherOrderCollectionProxy::class,
    Illuminate\Support\HigherOrderTapProxy::class => Tightenco\Support\HigherOrderTapProxy::class,
    Illuminate\Support\HtmlString::class => Tightenco\Support\HtmlString::class,
    Illuminate\Support\Optional::class => Tightenco\Support\Optional::class,
    Illuminate\Support\Str::class => Tightenco\Support\Str::class,
    Illuminate\Support\Debug\Dumper::class => Tightenco\Support\Debug\Dumper::class,
    Illuminate\Support\Debug\HtmlDumper::class => Tightenco\Support\Debug\HtmlDumper::class,
];

foreach ($aliases as $illuminate => $tighten) {
    if (class_exists($illuminate) && ! interface_exists($illuminate) && ! trait_exists($illuminate)) {
        class_alias($illuminate, $tighten);
    }
}
