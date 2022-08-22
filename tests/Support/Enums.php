<?php

namespace Tightenco\Collect\Tests\Support;

enum TestEnum
{
    case A;
}

enum TestBackedEnum: int
{
    case A = 1;
}
