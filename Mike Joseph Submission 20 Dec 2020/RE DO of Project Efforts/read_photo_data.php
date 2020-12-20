<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once("./includes/database_configure.php");
    include_once("./includes/photo.php");

    //Open the file
    $file_handle = fopen('./photolist.csv', 'r');

    //Read the first line (which is the row of headers)
    $first_line = fgetcsv($file_handle);

    //Print out the headers
    for($i=0; $i<count($first_line); $i++){
        print_r('Column header found: '.$first_line[$i].'<br>');
    }

    //Create an empty array that will be filled with Photos
    $photos = array();
    
    //This loop reads through the data file and instantiates Photo objects for each row
    //It stores these objects in the $photos array
    while($data_row = fgetcsv($file_handle)){
        $photo = new Photo();
        $photo->setData($data_row);
        $photo->save();
        array_push($photos, $photo);
    }

    //Close the file
    fclose($file_handle);
?>