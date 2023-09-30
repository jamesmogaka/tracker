<?php
$host = "localhost";
$username = "root";
$password = "";
$database = "tracker_new";

function fetch_minutes(){
//
//Connect to my database using mysqli
$conn = mysqli_connect($GLOBALS['host'], $GLOBALS['username'], $GLOBALS['password'], $GLOBALS['database']);
//
//exit incase of unsuccessful db connection
if(!$conn){
    return "Connection unsuccessful". mysqli_connect_error();
}

//formulate query
$query = file_get_contents('minutes.sql');

//execute query storing results in a variable
$results = mysqli_query($conn, $query);

//Using the results check if there were errors executing the query
if(!$results){
    return "query execution failed". mysqli_error($conn);
}

//create array for storing individual minutes returned from the query
$minutes = array();

//As long as there is a row in the query results add the row to the minutes array
while ($row=mysqli_fetch_assoc($results)){
    $minutes[] = $row;
}

//Close connection to the database
mysqli_close($conn);

//Finally encode the minutes to json
return json_encode($minutes);
}
