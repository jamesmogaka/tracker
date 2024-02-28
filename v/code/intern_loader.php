<?php
namespace mutall\capture;

include '../../../schema/v/code/schema.php';
include '../../../schema/v/code/questionnaire.php';
//
//Load the mappings to a database
$q = new \mutall\questionnaire("tracker_24");

$tname = 'tracker';

$sql = 'select
            name,
            surname,
            initials,
            qualification,
            university,
            image,
            start_date,
            end_date,
            user,
            year
        from
            intern';

$table = new query(
        //
        //The name of the text table    
        $tname,
        //
        //The sql statement to get the data
        $sql,
        //
        //The dbase to execute the query aganist
        'tracker_mogaka'
);

$fn = '\mutall\capture\lookup';

// $exp = new lookup($tname, 'intern');
//
//Map data from a csv file to a the database
$layout = [
    $table,
    [[$fn, $tname, 'name'], "intern", "name"],
    [[$fn, $tname, 'surname'], "intern", "surname"],
    [[$fn, $tname, 'initials'], "intern", "initials"],
    [[$fn, $tname, 'qualification'], "intern", "qualification"],
    [[$fn, $tname, 'university'], "intern", "university"],
    [[$fn, $tname, 'image'], "intern", "image"],
    [[$fn, $tname, 'start_date'], "intern", "start_date"],
    [[$fn, $tname, 'end_date'], "intern", "end_date"],
    [[$fn, $tname, 'user'], "intern", "user"],
    [[$fn, $tname, 'year'], "intern", "year"],
];
//
//Load the data using the most common method
$result = $q -> load_common($layout);
//
//print the q
echo $result;
