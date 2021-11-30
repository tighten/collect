<?php

$aliases = [/*--- ALIASES ---*/];

# echo "\n\n-- Aliasing....\n---------------------------------------------\n\n";

foreach ($aliases as $tighten => $illuminate) {
    if (! class_exists($illuminate) && ! interface_exists($illuminate) && ! trait_exists($illuminate)) {
        # echo "Aliasing {$tighten} to {$illuminate}.\n";
        class_alias($tighten, $illuminate);
    }
}
