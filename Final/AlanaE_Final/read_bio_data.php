<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once("./includes/db_config.php");
    include_once("./includes/Biography.php");

    $file_handle = fopen('./artist_biopics.csv', 'r');

    $first_line = fgetcsv($file_handle);

    for($i=0; $i<count($first_line); $i++){
        print_r('Column header found: '.$first_line[$i].'<br>');
    }

    $bios = array();
     
    while($data_row = fgetcsv($file_handle)){
        $biography = new Biography();
        $biography->setData($data_row);
        $biography->save();
        array_push($bios, $biography);
    }

    fclose($file_handle);
?>