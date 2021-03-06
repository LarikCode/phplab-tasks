<?php
/**
 * The $minute variable contains a number from 0 to 59 (i.e. 10 or 25 or 60 etc).
 * Determine in which quarter of an hour the number falls.
 * Return one of the values: "first", "second", "third" and "fourth".
 * Throw InvalidArgumentException if $minute is negative of greater than 60.
 * @see https://www.php.net/manual/en/class.invalidargumentexception.php
 *
 * @param int $minute
 * @return string
 * @throws InvalidArgumentException
 */
function getMinuteQuarter(int $minute)
{
    // Depending on the value of the input parameter, form the result
    if ($minute < 0 || $minute > 59) {
        throw new InvalidArgumentException (
            'getMinuteQuarter function only accepts integers 0..59. Input was: ' . $minute
        );
    } elseif ($minute > 0 && $minute <= 15) {
        return 'first';
    } elseif ($minute > 15 && $minute <= 30) {
        return 'second';
    } elseif ($minute > 30 && $minute <= 45) {
        return 'third';
    } elseif (($minute > 45 && $minute < 60) || $minute === 0) {
        return 'fourth';
    }
}

/**
 * The $year variable contains a year (i.e. 1995 or 2020 etc).
 * Return true if the year is Leap or false otherwise.
 * Throw InvalidArgumentException if $year is lower than 1900.
 * @see https://en.wikipedia.org/wiki/Leap_year
 * @see https://www.php.net/manual/en/class.invalidargumentexception.php
 *
 * @param int $year
 * @return boolean
 * @throws InvalidArgumentException
 */
function isLeapYear(int $year)
{
    // If the year is less than 1900 then return an InvalidArgumentException
    if ($year < 1900) {
        throw new InvalidArgumentException (
            'isLeapYear function only accepts integers >= 1900. Input was: ' . $year
        );
    }

    // Check if the year is a leap year
    $leap = date('L', mktime(0, 0, 0, 1, 1, $year));

    // Return the result
    return (boolean)$leap;
}

/**
 * The $input variable contains a string of six digits (like '123456' or '385934').
 * Return true if the sum of the first three digits is equal with the sum of last three ones
 * (i.e. in first case 1+2+3 not equal with 4+5+6 - need to return false).
 * Throw InvalidArgumentException if $input contains more or less than 6 digits.
 * @see https://www.php.net/manual/en/class.invalidargumentexception.php
 *
 * @param string $input
 * @return boolean
 * @throws InvalidArgumentException
 */
function isSumEqual(string $input)
{
    // Convert string to number
    $number = (int)$input;

    // Convert the string to a character array
    $str = str_split($input);

    // If the argument is not a six-digit number, then return an InvalidArgumentException
    if ($number < 100000 || $number > 999999 || count($str) != 6) {
        throw new InvalidArgumentException (
            'isSumEqual function only accepts a six-digit integers. Input was: ' . $input
        );
    }

    // If the sum of the first three digits is equal to the sum of the last three, then return true otherwise false
    return (((int)$str[0] + (int)$str[1] + (int)$str[2]) === ((int)$str[3] + (int)$str[4] + (int)$str[5]));
}