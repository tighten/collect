<?php

namespace Illuminate\Contracts\Support;

if (!interface_exists(Arrayable::class)) {
    interface Arrayable {}
}

if (!interface_exists(Htmlable::class)) {
    interface Htmlable {}
}

if (!interface_exists(Jsonable::class)) {
    interface Jsonable {}
}

