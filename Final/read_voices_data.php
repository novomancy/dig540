<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once("./includes/db_config.php");
    include_once("./includes/Recording.php");

    //Open the file
    $file_handle = fopen('./voices.csv', 'r');

    //Read the first line (which is the row of headers)
    $first_line = fgetcsv($file_handle);

    //Print out the headers
    for($i=0; $i<count($first_line); $i++){
        print_r('Column header found: '.$first_line[$i].'<br>');
    }

    //Create an empty array that will be filled with albums
    $recordings = array();
    
    //This loop reads through the data file and instantiates Album objects for each row
    //It stores these objects in the $albums array
    while($data_row = fgetcsv($file_handle)){
        $recording = new Recording();
        $recording->setData($data_row);
        $recording->save();
        array_push($recordings, $recording);
    }

    //Close the file
    fclose($file_handle);
?>