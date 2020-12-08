<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once("./includes/db_config.php");
    include_once("./includes/Biography.php");

    //Open the file
    $file_handle = fopen('./artist_biopics.csv', 'r');

    //Read the first line (which is the row of headers)
    $first_line = fgetcsv($file_handle);

    // //Print out the headers. May not need this if we don't want to display the headers
    for($i=0; $i<count($first_line); $i++){
        print_r('Column header found: '.$first_line[$i].'<br>');
    }

    //Create an empty array that will be filled with bios
    $bios = array();
    
    //This loop reads through the data file and instantiates Biography objects for each row
    //It stores these objects in the $bios array
    while($data_row = fgetcsv($file_handle)){
        $biography = new Biography();
        $biography->setData($data_row);
        $biography->save();//this line was added to make sure the Bios are saved to DB
        array_push($bios, $biography);
    }

    //Close the file
    fclose($file_handle);
?>