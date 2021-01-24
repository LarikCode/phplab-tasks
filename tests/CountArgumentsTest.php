<?php

use PHPUnit\Framework\TestCase;

class CountArgumentsTest extends TestCase
{
    /**
     * @dataProvider positiveDataProvider
     */
    public function testPositive($input, $expected)
    {
        $this->assertEquals($expected, countArguments(...$input));
    }

    /**
     * @dataProvider negativeDataProvider
     */
    public function testNegative($input, $expected)
    {
        $this->assertNotEquals($expected, countArguments(...$input));
    }

    public function positiveDataProvider()
    {
        return [
            [['world'], ['argument_count' => 1, 'argument_values' => ['world']]],
            [['Hello', 'world'], ['argument_count' => 2, 'argument_values' => ['Hello', 'world']]],
            [[3, 5], ['argument_count' => 2, 'argument_values' => [3, 5]]],
            [[7, 8, 9], ['argument_count' => 3, 'argument_values' => [7, 8, 9]]],
            [[], ['argument_count' => 0, 'argument_values' => []]]
        ];
    }

    public function negativeDataProvider()
    {
        return [
            [['Hello world'], []],
            [['Tom'], ['argument_count' => 1, 'argument_values' => ['John']]],
            [[5], ['argument_count' => 1, 'argument_values' => [6]]],
            [[], []]
        ];
    }
}