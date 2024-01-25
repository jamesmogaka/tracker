<?php
include '../../../schema/v/code/schema.php';
include '../../../schema/v/code/questionnaire.php';

//Map the following data to their attributes
$mapping = [
    ["2024", "workplan", "year"],
    ["muli", "intern", "surname"],
    ["mogaka", "intern", "surname"],
    
];
//
//Load the mappings toa database
$q = new mutall\questionnaire("tracker_mogaka");
//
//Load the data using the most common method
$result = $q -> load_common($mapping);
//
//Show the result
echo $result;
