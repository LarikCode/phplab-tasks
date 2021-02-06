<?php
/**
 * The $input variable contains an array of digits
 * Return an array which will contain the same digits but repetitive by its value
 * without changing the order.
 * Example: [1,3,2] => [1,3,3,3,2,2]
 *
 * @param array $input
 * @return array
 */
function repeatArrayValues(array $input)
{
    $result = [];

    // For each element, duplicate it the required number of times
    foreach ($input as $item) {
        // Check that the number is integer and positive, then duplicate
        if (is_int($item) && $item > 0) {
            $result = array_pad($result, count($result) + $item, $item);
        }
    }

    return $result;
}

/**
 * The $input variable contains an array of digits
 * Return the lowest unique value or 0 if there is no unique values or array is empty.
 * Example: [1, 2, 3, 2, 1, 5, 6] => 3
 *
 * @param array $input
 * @return int
 */
function getUniqueValue(array $input)
{
    sort($input);

    $countValue = array_count_values($input);

    asort($countValue);

    // If the first value is 1, then the key is the smallest unique element
    return (!empty($countValue) && $countValue[array_key_first($countValue)] === 1) ? array_key_first($countValue) : 0;
}

/**
 * The $input variable contains an array of arrays
 * Each sub array has keys: name (contains strings), tags (contains array of strings)
 * Return the list of names grouped by tags
 * !!! The 'names' in returned array must be sorted ascending.
 *
 * Example:
 * [
 *  ['name' => 'potato', 'tags' => ['vegetable', 'yellow']],
 *  ['name' => 'apple', 'tags' => ['fruit', 'green']],
 *  ['name' => 'orange', 'tags' => ['fruit', 'yellow']],
 * ]
 *
 * Should be transformed into:
 * [
 *  'fruit' => ['apple', 'orange'],
 *  'green' => ['apple'],
 *  'vegetable' => ['potato'],
 *  'yellow' => ['orange', 'potato'],
 * ]
 *
 * @param array $input
 * @return array
 */
function groupByTag(array $input)
{
    $result = [];

    foreach ($input as $key => $item) {
        if (array_key_exists('tags', $item) && array_key_exists('name', $item)) {
            foreach ($item['tags'] as $tag) {
                $result[$tag][] = $item['name'];
            }
        }
    }

    foreach ($result as $key => $value) {
        sort($result[$key]);
    }

    return $result;
}