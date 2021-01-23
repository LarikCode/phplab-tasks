<?php

use PHPUnit\Framework\TestCase;

class SayHelloArgumentTest extends TestCase
{
    /**
     * @dataProvider positiveDataProvider
     */
    public function testPositive($input, $expected)
    {
        $this->assertEquals($expected, sayHelloArgument($input));
    }

    /**
     * @dataProvider negativeDataProvider
     */
    public function testNegative($input, $expected)
    {
        $this->assertNotEquals($expected, sayHelloArgument($input));
    }

    public function positiveDataProvider()
    {
        return [
            ['world', 'Hello world'],
            ['John', "Hello John"],
            [5, 'Hello 5'],
            [5.0, 'Hello 5'],
            [1e3, 'Hello 1000'],
            [true, 'Hello 1'],
            [false, 'Hello ']
        ];
    }

    public function negativeDataProvider()
    {
        return [
            ['Hello world', 'Hello world'],
            ['Tom', 'Hello John'],
            [5, 'Hello 6'],
            ['','']
        ];
    }
}