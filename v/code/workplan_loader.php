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
        'minutes.csv',
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
    [[$fn, $tname, 'project'], "project", "project"],
    [[$fn, $tname, 'presentation'], "presentation", "presentation"],
    [[$fn, $tname, 'number'], "minute", "number"],
    [[$fn, $tname, 'summary'], "minute", "summary"],
    [[$fn, $tname, 'detail'], "minute", "detail"],
    [[$fn, $tname, 'done'], "minute", "done"],
    
];
//
//Load the data using the most common method
$result = $q -> load_common($layout);
//
//print the q
echo $result;
