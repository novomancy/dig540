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

    $recordings = array();

    while($data_row = fgetcsv($file_handle)){
        $recordings = new Recording();
        $recordings->setContributor($data_row[6]);
        $recordings->setTitle($data_row[1]);
        $recordings->setYear($data_row[2]);
        $recordings->setRank($data_row[0]);
        $recordings->setPermission($data_row[3]);
        $recordings->setGenre($data_row[5]);
        $recordings->setSubject($data_row[4]);
        $recordings->save();
        array_push($recordings, $recording);

    }
    

    fclose($file_handle);



?>