<?php

$aliases = [
    /**
     * Contracts
     */
    Tightenco\Collect\Contracts\Support\Arrayable::class => Illuminate\Contracts\Support\Arrayable::class,
    Tightenco\Collect\Contracts\Support\Htmlable::class => Illuminate\Contracts\Support\Htmlable::class,
    Tightenco\Collect\Contracts\Support\Jsonable::class => Illuminate\Contracts\Support\Jsonable::class,

    /**
     * Support
     */
    Tightenco\Collect\Support\Arr::class => Illuminate\Support\Arr::class,
    Tightenco\Collect\Support\Collection::class => Illuminate\Support\Collection::class,
    Tightenco\Collect\Support\HigherOrderCollectionProxy::class => Illuminate\Support\HigherOrderCollectionProxy::class,
    Tightenco\Collect\Support\HtmlString::class => Illuminate\Support\HtmlString::class,

    /**
     * Support\Debug
     */
    Tightenco\Collect\Support\Debug\Dumper::class => Illuminate\Support\Debug\Dumper::class,
    Tightenco\Collect\Support\Debug\HtmlDumper::class => Illuminate\Support\Debug\HtmlDumper::class,

    /**
     * Support\Traits
     */
    Tightenco\Collect\Support\Traits\Macroable::class => Illuminate\Support\Traits\Macroable::class,
];

foreach ($aliases as $tighten => $illuminate) {
    if (! class_exists($illuminate) && ! interface_exists($illuminate) && ! trait_exists($illuminate)) {
        class_alias($tighten, $illuminate);
    }
}
