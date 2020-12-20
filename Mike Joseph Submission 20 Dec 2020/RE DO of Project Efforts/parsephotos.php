<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once("./includes/database_configure.php");
    include_once("./includes/photos.php");

    //Open the file
    $file_handle = fopen('./photolist.csv', 'r');

    //Read the first line (which is the row of headers)
    $first_line = fgetcsv($file_handle);

    //Print out the headers
    for($i=0; $i<count($first_line); $i++){
        print_r('Column header found: '.$first_line[$i].'<br>');
    }

    //Create an empty array that will be filled with photos
    $photos = array();
    
    //This loop reads through the data file and instantiates Photo objects for each row
    //It stores these objects in the $photos array
    while($data_row = fgetcsv($file_handle)){
        $Photo = new Photo();
        $Photo->setData($data_row);
        array_push($photos, $photo);
    }

    //This loop iterates through the $photos array and prints out the data for each Photo
    for($i=count($photos)-1; $i>=0; $i--){
        print_r("<p>This is the #$i Photo:<br>");
        $photos[$i]->getData();
        print_r('</p>');
    }

    //Close the file
    fclose($file_handle);
?>
