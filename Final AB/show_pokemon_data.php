<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once ('./includes/db_config.php'); 
    include_once ('./includes/Pokemon.php'); 

    // creates an empty array to be filled with pokemon
    $pokemons = Pokemon::load_all();
    

    // this loop goes through the $albums array i just made and prints out the data for each album
    for($i=0; $i<count($pokemons); $i++){
       print_r('<p>');
        $pokemons[$i]->getData();
        print_r('</p>');
    }

?>
