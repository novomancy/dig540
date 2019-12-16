<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    
    include_once('./includes/db_config.php');
    include_once('./includes/Recording.php');
    
    $file_handle = fopen('./voices.csv', 'r');

    $first_line = fgetcsv($file_handle);

    for($i=0; $i<count($first_line); $i++){
        print_r('Column header found: '.$first_line[$i]. '<br>');
    
    }

    $voice = array();

    while($data_row = fgetcsv($file_handle)){
        $voices = new Voices();
        $voices->setContributor($data_row[6]);
        $voices->setTitle($data_row[1]);
        $voices->setYear($data_row[2]);
        $voices->setRank($data_row[0]);
        $voices->setPermission($data_row[3]);
        $voices->setGenre($data_row[5]);
        $voices->setSubject($data_row[4]);
        $voices->save();
        array_push($voice, $voices);

    }
    

    fclose($file_handle);



?>