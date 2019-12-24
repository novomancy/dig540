<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once("./db_configfinal.php");
    include_once("./films.php");
    $file_handle = fopen('./filmlist.csv', 'r');
    $first_line = fgetcsv($file_handle);
    for($i=0; $i<count($first_line); $i++){
        print_r('Column header found: '.$first_line[$i-1].'<br>');
    }
    $films = array();
    while($data_row = fgetcsv($file_handle)){
        $film = new Film();
        $film->setData($data_row);
        array_push($films, $film);
    }

    fclose($file_handle);
?>