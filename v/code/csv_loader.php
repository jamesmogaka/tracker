<?php
namespace mutall\capture;

include '../../../schema/v/code/schema.php';
include '../../../schema/v/code/questionnaire.php';
//
//Load the mappings to a database
$q = new \mutall\questionnaire("tracker_mogaka");

$tname = 'workplan2024';

$table = new csv(
        //
        //The name of the text table    
        $tname,
        //
        //The filename that holds the (milk) data    
        'workplan2024.csv',
        //
        //The following default values match the output from a database
        //query
        //
        //The header colmumn names. If empty, it means the user wishes 
        //to use the default values
        [],
        //
        //Text used as the value separator
        ",",
        //
        //The row number, starting from 0, where column names are stored
        //A negative number means that file has no header     
        0,
        //
        //The row number, starting from 0, where the table's body starts.        
        1
);

$fn = '\mutall\capture\lookup';

// $exp = new lookup($tname, 'intern');
//
//Map data from a csv file to a the database
$layout = [
    $table,
    ['2024', 'workplan', 'year'],
    [[$fn, $tname, 'intern'], "intern", "surname"],
    [[$fn, $tname, 'name'], "project", "name"],
    [[$fn, $tname, 'problem'], "project", "problem"],
    [[$fn, $tname, 'plan'], "project", "plan"],
    [[$fn, $tname, 'outcome'], "project", "outcome"],
    [[$fn, $tname, 'comment'], "project", "comment"],
    
];
//
//Load the data using the most common method
$result = $q -> load_common($layout);
//
//print the q
echo $result;
