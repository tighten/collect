<?php

$aliases = [
    TightenCo\Contracts\Support\Arrayable::class => Illuminate\Contracts\Support\Arrayable::class,
    TightenCo\Contracts\Support\Jsonable::class => Illuminate\Contracts\Support\Jsonable::class,
    TightenCo\Support\Traits\Macroable::class => Illuminate\Support\Traits\Macroable::class,
    TightenCo\Support\Arr::class => Illuminate\Support\Arr::class,
    TightenCo\Support\Collection::class => Illuminate\Support\Collection::class,
    TightenCo\Support\HigherOrderCollectionProxy::class => Illuminate\Support\HigherOrderCollectionProxy::class,
];

foreach ($aliases as $tighten => $illuminate) {
    if (! class_exists($illuminate) && ! interface_exists($illuminate) && ! trait_exists($illuminate)) {
        class_alias($tighten, $illuminate);
    }
}
