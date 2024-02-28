<?php
namespace mutall\capture;

include '../../../schema/v/code/schema.php';
include '../../../schema/v/code/questionnaire.php';
//
//Load the mappings to a database
$q = new \mutall\questionnaire("tracker_24");

$tname = 'tracker';

$sql = 'select
            project.name,
            project.problem,
            project.outcome,
            project.comment,
            project.activities,
            project.termination,
            project.theme,
            workplan.year,
            intern.surname   
        from
            project
            inner join workplan on project.workplan = workplan.workplan
            inner join intern on workplan.intern = intern.intern';

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
    [[$fn, $tname, 'name'], "project", "name"],
    [[$fn, $tname, 'problem'], "project", "problem"],
    [[$fn, $tname, 'outcome'], "project", "outcome"],
    [[$fn, $tname, 'comment'], "project", "comment"],
    [[$fn, $tname, 'activities'], "project", "activities"],
    [[$fn, $tname, 'termination'], "project", "termination"],
    [[$fn, $tname, 'theme'], "project", "theme"],
    [[$fn, $tname, 'year'], "workplan", "year"],
    [[$fn, $tname, 'surname'], "intern", "surname"],
];
//
//Load the data using the most common method
$result = $q -> load_common($layout,'/tracker/v/code/log.xml', '/tracker/v/code/error.html');
//
//print the q
echo $result;
