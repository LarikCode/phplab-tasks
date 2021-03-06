<?php
/**
 * The $input variable contains text in snake case (i.e. hello_world or this_is_home_task)
 * Transform it into a camel-cased string and return (i.e. helloWorld or thisIsHomeTask)
 * @see http://xahlee.info/comp/camelCase_vs_snake_case.html
 *
 * @param string $input
 * @return string
 */
function snakeCaseToCamelCase(string $input)
{
    // If the string is empty then return it
    if (empty($input)) {
        return $input;
    }

    // We split the string into an array of words
    $words = explode('_', $input);

    // The first word does not need to be changed, save it
    $firstWord = $words[0];

    // All words are capitalized
    $words = array_map('ucfirst', $words);

    // First word unchanged
    $words[0] = $firstWord;

    // Convert the array to a string and return it
    return implode($words);
}

/**
 * The $input variable contains multibyte text like 'ФЫВА олдж'
 * Mirror each word individually and return transformed text (i.e. 'АВЫФ ждло')
 * !!! do not change words order
 *
 * @param string $input
 * @return string
 */
function mirrorMultibyteString(string $input)
{
    // Split the string into characters
    preg_match_all('/./us', $input, $ar);

    // Write all characters in reverse order
    $str = join('', array_reverse($ar[0]));

    // Write all words in reverse order and return the result
    return join(' ', array_reverse(mb_split(' ', $str)));
}

/**
 * My friend wants a new band name for her band.
 * She likes bands that use the formula: 'The' + a noun with the first letter capitalized.
 * However, when a noun STARTS and ENDS with the same letter,
 * she likes to repeat the noun twice and connect them together with the first and last letter,
 * combined into one word like so (WITHOUT a 'The' in front):
 * dolphin -> The Dolphin
 * alaska -> Alaskalaska
 * europe -> Europeurope
 * Implement this logic.
 *
 * @param string $noun
 * @return string
 */
function getBrandName(string $noun)
{
    // Compare the first and last letters
    if (substr($noun, 0, 1) === substr($noun, -1, 1)) {
        // If they are equal, then duplicate the word
        // (the second word without the first letter)
        // and write the resulting word with a capital letter.
        return ucfirst($noun . substr($noun, 1));
    } else {
        // If they are not equal,
        // then add an article and write the word with a capital letter
        return "The " . ucfirst($noun);
    }
}