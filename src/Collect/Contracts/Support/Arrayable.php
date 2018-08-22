<?php

namespace Tightenco\Collect\Contracts\Support;

interface Arrayable extends \Illuminate\Contracts\Support\Arrayable
{
    /**
     * Get the instance as an array.
     *
     * @return array
     */
    public function toArray();
}
