<?php

use PHPUnit\Framework\TestCase;
use src\oop\Commands\DivCommand;

class DivCommandTest extends TestCase
{
    /**
     * @var DivCommand
     */
    private $command;

    /**
     * @see https://phpunit.readthedocs.io/en/9.3/fixtures.html#more-setup-than-teardown
     *
     * @inheritdoc
     */
    public function setUp(): void
    {
        $this->command = new DivCommand();
    }

    /**
     * @return array
     */
    public function commandPositiveDataProvider()
    {
        return [
            [5, 2, 2.5],
            [0.1, 0.1, 1],
            [-1, 2, -0.5],
            ['5', 10, 0.5],
        ];
    }

    /**
     * @return array
     */
    public function commandNegativeDataProvider()
    {
        return [
            [1],
            [5, 0],
            [0.1, 0],
            [-1, 2, -0.5],
            ['5', 10, 0.5],
        ];
    }

    /**
     * @dataProvider commandPositiveDataProvider
     */
    public function testCommandPositive($a, $b, $expected)
    {
        $result = $this->command->execute($a, $b);

        $this->assertEquals($expected, $result);
    }

    /**
     * @dataProvider commandNegativeDataProvider
     */
    public function testCommandNegative(...$args)
    {
        $this->expectException(\InvalidArgumentException::class);

        $this->command->execute(...$args);
    }

    /**
     * @see https://phpunit.readthedocs.io/en/9.3/fixtures.html#more-setup-than-teardown
     *
     * @inheritdoc
     */
    public function tearDown(): void
    {
        unset($this->command);
    }
}