<?php

use PHPUnit\Framework\TestCase;

class SayHelloArgumentWrapperTest extends TestCase
{
    /**
     * @dataProvider negativeDataProvider
     */
    public function testNegative($input)
    {
        $this->expectException(InvalidArgumentException::class);

        sayHelloArgumentWrapper($input);
    }

    public function negativeDataProvider()
    {
        return [
            [[]],
            [['Tom']],
            [['John']],
            [[['Hello'],['world']]],
            [function(){return 0;}],
            [null]
        ];
    }
}