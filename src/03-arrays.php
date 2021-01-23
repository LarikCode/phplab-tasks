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
    // Formation of the result
    $result = [];

    // For each element, duplicate it the required number of times
    foreach ($input as $item) {
        // Check that the number is integer and positive, then duplicate
        if (is_int($item) && $item > 0) {
            $result = array_pad($result, count($result) + $item, $item);
        }
    }

    // Return the result
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
    // Sort the input array
    sort($input);

    // Count the number of occurrences of each item
    $countValue = array_count_values($input);

    // Sort by value keeping keys
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
    // Formation of the result
    $result = [];

    // The value with the key 'tags'
    // becomes the keys of the resulting array
    foreach ($input as $key => $item) {
        // check if the required keys are in the array
        if (array_key_exists('tags', $item) && array_key_exists('name', $item)) {
            foreach ($item['tags'] as $tag) {
                // Add a new name element to the result
                if (array_key_exists($tag, $result)) {
                    array_push($result[$tag], $item['name']);
                } else {
                    $result[$tag] = [$item['name']];
                }
            }
        }
    }

    // Sorting the result
    foreach ($result as $key => $subarr) {
        sort($result[$key]);
    }

    // Return the result
    return $result;
}