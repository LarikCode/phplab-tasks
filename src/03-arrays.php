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
    // If the array is empty then return 0
    if (empty($input)) return 0;

    // Formation of the result
    $result = null;
    $key_last = array_key_last($input);

    // Compare each element with others
    foreach ($input as $key1 => $value1) {
        foreach ($input as $key2 => $value2) {
            // If the element is not unique, go to the next
            if ($input[$key1] === $input[$key2] && $key1 != $key2) break 1;
            // If the element is the smallest of the unique ones, then save it
            if ($key2 === $key_last && (is_null($result) || $result > $input[$key1])) {
                $result = $input[$key1];
            }
        }
    }

    // If the result is empty return 0, else return the result
    return is_null($result) ? 0 : $result;
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