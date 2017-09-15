<?php

$aliases = [
    Tightenco\Contracts\Support\Arrayable::class => Illuminate\Contracts\Support\Arrayable::class,
    Tightenco\Contracts\Support\Jsonable::class => Illuminate\Contracts\Support\Jsonable::class,
    Tightenco\Support\Traits\Macroable::class => Illuminate\Support\Traits\Macroable::class,
    Tightenco\Support\Arr::class => Illuminate\Support\Arr::class,
    Tightenco\Support\Collection::class => Illuminate\Support\Collection::class,
    Tightenco\Support\HigherOrderCollectionProxy::class => Illuminate\Support\HigherOrderCollectionProxy::class,
];

foreach ($aliases as $tighten => $illuminate) {
    if (! class_exists($illuminate) && ! interface_exists($illuminate) && ! trait_exists($illuminate)) {
        class_alias($tighten, $illuminate);
    }
}
