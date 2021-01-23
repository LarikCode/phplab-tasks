<?php

use PHPUnit\Framework\TestCase;

class SayHelloTest extends TestCase
{
    /**
     * @dataProvider positiveDataProvider
     */
    public function testPositive($expected)
    {
        $this->assertEquals($expected, sayHello());
    }

    /**
     * @dataProvider negativeDataProvider
     */
    public function testNegative($expected)
    {
        $this->assertNotEquals($expected, sayHello());
    }

    public function positiveDataProvider()
    {
        return [
            ['Hello'],
            ["Hello"]
        ];
    }

    public function negativeDataProvider()
    {
        return [
            ['Hello world'],
            ["Hello John"],
            [5],
            ['']
        ];
    }
}