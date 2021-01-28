<?php

use PHPUnit\Framework\TestCase;

class GetUniqueFirstLettersTest extends TestCase
{
    /**
     * @dataProvider positiveDataProvider
     */
    public function testPositive($input, $expected)
    {
        $this->assertEquals($expected, getUniqueFirstLetters($input));
    }

    /**
     * @dataProvider negativeDataProvider
     */
    public function testNegative($input)
    {
        $this->expectException(InvalidArgumentException::class);

        getUniqueFirstLetters($input);
    }

    public function positiveDataProvider()
    {
        return [
            [[['name' => 'Abcd'], ['name' => 'Cabc'], ['name' => 'Dabc']], ['A', 'C', 'D']],
            [[],[]],
            [[['name' => 'Abcd'], ['name' => 'Cabc'], ['name' => 'Dabc'], ['name' => 'Eabc']], ['A', 'C', 'D', 'E']]
        ];
    }

    public function negativeDataProvider()
    {
        return [
            [[['name' => 'Abcd'], ['name' => 'Cabc'], ['Dabc']]],
            [[[], [], []]]
        ];
    }
}