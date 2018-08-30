<?php

namespace Tightenco\Collect\Contracts\Support;

interface Htmlable extends \Illuminate\Contracts\Support\Htmlable
{
    /**
     * Get content as a string of HTML.
     *
     * @return string
     */
    public function toHtml();
}
