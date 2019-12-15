<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 

    include_once ('./includes/db_config.php'); 
    include_once ('./includes/Pokemon.php'); 

    $file_handle = fopen('./pokemon.csv', 'r');

    $first_line = fgetcsv($file_handle);

    for($i=0; $i<count($first_line); $i++){
        print_r('<div style ="background-color:goldenrod">'.'Column header found: '.$first_line[$i].'<br>'.'</div>');
    }
    //the first part and the first loop need to stay because getting the column headers is its own thing i think

    $pokemons = array();
    
    while($data_row = fgetcsv($file_handle)){

        $pokemon = new Pokemon();
        $pokemon->setData($data_row);
        //this calls the setData function which does the stuff that the code that was here before did
        array_push($pokemons, $pokemon);
    }

    for($i=0; $i<count($pokemons); $i++){

        $pokemons[$i]->getData();
        //here i am just calling the function that I made up above instead of all the stuff that was here before
        print_r('</p>');
    }

    fclose($file_handle);
?>
