<?php

$aliases = [
    /**
     * Contracts
     */
    Tightenco\Contracts\Support\Arrayable::class => Illuminate\Contracts\Support\Arrayable::class,
    Tightenco\Contracts\Support\Htmlable::class => Illuminate\Contracts\Support\Htmlable::class,
    Tightenco\Contracts\Support\Jsonable::class => Illuminate\Contracts\Support\Jsonable::class,

    /**
     * Support
     */
    Tightenco\Support\Arr::class => Illuminate\Support\Arr::class,
    Tightenco\Support\Collection::class => Illuminate\Support\Collection::class,
    Tightenco\Support\HigherOrderCollectionProxy::class => Illuminate\Support\HigherOrderCollectionProxy::class,
    Tightenco\Support\HtmlString::class => Illuminate\Support\HtmlString::class,

    /**
     * Support\Debug
     */
    Tightenco\Support\Debug\Dumper::class => Illuminate\Support\Debug\Dumper::class,
    Tightenco\Support\Debug\HtmlDumper::class => Illuminate\Support\Debug\HtmlDumper::class,

    /**
     * Support\Traits
     */
    Tightenco\Support\Traits\Macroable::class => Illuminate\Support\Traits\Macroable::class,
];

foreach ($aliases as $tighten => $illuminate) {
    if (! class_exists($illuminate) && ! interface_exists($illuminate) && ! trait_exists($illuminate)) {
        class_alias($tighten, $illuminate);
    }
}
