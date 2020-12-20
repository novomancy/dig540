<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once("./includes/db_config.php");
    include_once("./includes/Artifact.php");

    $file_handle = fopen('./Artifacts.csv', 'r');

    $first_line = fgetcsv($file_handle);

    for($i=0; $i<count($first_line); $i++){
        print_r('Column header found: '.$first_line[$i].'<br>');
    }

    $artifacts = array();
    
    while($data_row = fgetcsv($file_handle)){
        $artifact = new Artifact();
        $artifact->setData($data_row);
        array_push($artifacts, $artifact);
    }

    for($i=count($artifacts)-1; $i>=0; $i--){
        print_r("<p>This is the #$i artifact:<br>");
        $artifacts[$i]->getData();
        print_r('</p>');
    }

    fclose($file_handle);
?>
