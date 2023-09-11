<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 

    include('./alana_includes/db_config.php');
    include('./alana_includes/Album.php');

    $file_handle = fopen('./albumlist.csv', 'r');

    $first_line = fgetcsv($file_handle);

    for($i=0; $i<count($first_line); $i++){
        print_r('Column header found: '.$first_line[$i].'<br>');
    }

    $albums = array();
    
    while($data_row = fgetcsv($file_handle)){
        $album = new Album();
        $album ->setData($data_row);
        $album->save();//this line was added to the read_album_data file to make sure the Albums are saved to DB
        array_push($albums, $album);
    }

    for($i=0; $i<count($albums); $i++){
        print_r("<p>This is the #".($i+1). " album:<br>");

        $albums[$i]->getData();
    }

    fclose($file_handle);

?>
