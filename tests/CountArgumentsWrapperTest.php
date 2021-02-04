<?php

use PHPUnit\Framework\TestCase;

class CountArgumentsWrapperTest extends TestCase
{
    /**
     * @dataProvider negativeDataProvider
     */
    public function testNegative(...$input)
    {
        $this->expectException(InvalidArgumentException::class);

        countArgumentsWrapper(...$input);
    }

    public function negativeDataProvider()
    {
        return [
            [5],
            [5, 6, 7],
            [null],
            [function(){ return 'Hello world';}],
            [true],
            [false]
        ];
    }
}