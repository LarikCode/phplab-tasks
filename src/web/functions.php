<?php
/**
 * The $airports variable contains array of arrays of airports (see airports.php)
 * What can be put instead of placeholder so that function returns the unique first letter of each airport name
 * in alphabetical order
 *
 * Create a PhpUnit test (GetUniqueFirstLettersTest) which will check this behavior
 *
 * @param array $airports
 * @return string[]
 */
function getUniqueFirstLetters(array $airports)
{
    $firstLetters = [];

    foreach ($airports as $airport) {
        if (key_exists('name', $airport) && !in_array(substr($airport['name'], 0, 1), $firstLetters)) {
            $firstLetters[] = substr($airport['name'], 0, 1);
        } elseif (!key_exists('name', $airport)) {
            throw new InvalidArgumentException (
                'getUniqueFirstLetters function only accepts array with key "name"'
            );
        }
    }

    sort($firstLetters);

    return $firstLetters;
}