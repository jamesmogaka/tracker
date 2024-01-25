<?php
include '../../../schema/v/code/schema.php';
include '../../../schema/v/code/questionnaire.php';

//Map the following data to their attributes
$mapping = [
    ["karanja", "intern", "surname"],
    ["2024", "workplan", "year"]
];
//
//Load the mappings to a database
$q = new mutall\questionnaire("tracker_mogaka");
//
//Load the data using the most common method
$result = $q -> load_common($mapping);
//
//print the q
echo $result;
//
//Print success on completion
echo 'success!';