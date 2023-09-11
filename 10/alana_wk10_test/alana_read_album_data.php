<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include('./alana_includes/db_config.php');
    include('./alana_includes/Album.php');

    //Open the file
    $file_handle = fopen('./albumlist.csv', 'r');

    //Read the first line (which is the row of headers)
    $first_line = fgetcsv($file_handle);

    //Print out the headers. May not need this if we don't want to display the headers
    for($i=0; $i<count($first_line); $i++){
        print_r('Column header found: '.$first_line[$i].'<br>');
    }

    //Create an empty array that will be filled with albums
    $albums = array();
    
    //This loop reads through the data file and instantiates Album objects for each row
    //It stores these objects in the $albums array
    while($data_row = fgetcsv($file_handle)){
        $album = new Album();
        $album->setData($data_row);
        $album->save();//this line was added to make sure the Albums are saved to DB
        array_push($albums, $album);
    }

    //Close the file
    fclose($file_handle);
?>