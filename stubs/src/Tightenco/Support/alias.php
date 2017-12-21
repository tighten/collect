<?php

$aliases = [/*--- ALIASES ---*/];

foreach ($aliases as $illuminate => $tighten) {
    if (class_exists($illuminate) && ! interface_exists($illuminate) && ! trait_exists($illuminate)) {
        class_alias($illuminate, $tighten);
    }
}
