<?php
namespace mutall\capture;
//
//Resolve references to the schema library
include '../../../schema/v/code/schema.php';
//
//Resolve reference to the questionnaire class using teh schema library
include '../../../schema/v/code/questionnaire.php';
//
//Define a new questionnaire for uploading data to the tracker_mogaka database
$q = new \mutall\questionnaire('tracker_mogaka');

//Create the sql table (layout)
$query = new query(
    't1',
    'select surname as user_name, name as user_fullname from intern;',
    'tracker_mogaka'
);
//
//Setup a default password of mutall_data for every new user created
$password = password_hash('mutall_data', PASSWORD_DEFAULT);

//The layouts neded for data loading
$layouts = [
    //
    //The qery is one of the layouts
    $query,
    //
    //Map the source table columns to their corresponding destinations
    [new lookup('t1', 'user_name'), 'user', 'name', [], 'mutall_users'],
        
    [new lookup('t1', 'user_fullname'), 'user', 'full_name', [], 'mutall_users'],
    
    [new lookup('t1', 'user_name'), 'intern', 'surname'],
    
    [new lookup('t1', 'user_fullname'),'intern', 'name'],
    
    [$password, 'user', 'password', [], 'mutall_users'],
    
    ['mutall_data', 'business', 'id', [], 'mutall_users'],
    
    [null, 'member', 'member',[], 'mutall_users']
];

echo $q->load_common($layouts);