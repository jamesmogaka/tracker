<?php
namespace mutall\capture;

include '../../../schema/v/code/schema.php';
include '../../../schema/v/code/questionnaire.php';
//
//Load the mappings to a database
$q = new \mutall\questionnaire("tracker_24");
//
//The name of the table
$tname = 'workplan2024';
//
//The matrix data to be loaded
//$data = [
//    ['muli', 'tracker', 'portfolio/update'],
//    ['muli', 'balansys', 'receipts'],
//    ['muli', 'tracker', 'financial/accounting'],
//    ['muli', 'cybercafe', 'cor_problem'],
//    ['muli', 'rentize', 'contracts/crud'],
//    ['karanja', 'Mlima', 'consolidation'],
//    ['karanja', 'Chat', 'chat/messenger/socket/inheritance'],
//    ['karanja', 'Sheetjs', 'sheetjs + firebase/webpack'],
//    ['mogaka', 'tracker', 'portfolio/update'],
//    ['mogaka', 'tracker', 'workplans'],
//    ['mogaka', 'metavisuo', 'crud-ear'],
//    ['mogaka', 'rentize', 'invoice/queries'],
//    ['mogaka', 'rentize', 'kplc/billing/android'],
//    ['mogaka', 'registration', 'io library'],
//];
//$data = [
//    ['karanja', 'tracker', 'Update the workplan to indicate the projects and activities for the year', 'portfolio/update'],
//    ['karen', 'tracker', 'Create a workplan indicating the projects and activities for the year', 'portfolio'],
//    ['karen', 'mutall', 'Take stock of all mutall project and acess their usage of our librariess', ' lib/assessment'],
//    ['karen', 'ranix', 'Learn sql for interrogation of data in databases', 'querying'],
//];
$data = [
    ['msafiri', 'mutall', 'Manage the documentation system. Make it possible for Creation of documentation, review of documentation, Updation and deletion of documentation', 'documentation/crud'],
    ['msafiri', 'tracker', 'Create a workplan indicating the projects and activities for the year', 'portfolio'],
    ['msafiri', 'ranix', 'Learn sql for interrogation of data in databases', 'querying'],
    ['msafiri', 'mutall', 'Learning how to construct and style html tables. Also learn how to produce tables programatically', 'tabulation'],
];

$table = new matrix(
        //
        //The name of the text table    
        $tname,
        //
        //The Collumn names of the array
        ['surname', 'project', 'problem', 'activity'],
        //
        //The array that holds the data
        $data
);
//
//
$fn = '\mutall\capture\lookup';
//
//Map data from a csv file to a the database
$layout = [
    $table,
    ['2024-02-26','intern', 'start_date'],
    ['elias msafiri','intern', 'name'],
    ['em','intern', 'initials'],
    [[$fn, $tname, 'surname'], "intern", "surname"],
    [2024, "workplan", 'year'],
    [[$fn, $tname, 'project'], "project", "name"],
    [[$fn, $tname, 'problem'], "project", "problem"],
    [[$fn, $tname, 'activity'], "activity", "summary"],
];
//
//Load the data using the most common method
$result = $q -> load_common($layout,'/tracker/v/code/log.xml', '/tracker/v/code/error.html');
//
//print the q
echo $result;
