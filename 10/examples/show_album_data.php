<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once("./includes/db_config.php");
    include_once("./includes/Album.php");

    //Create an empty array that will be filled with albums
    if(isset($_GET['genre']) && $_GET['genre'] != ''){
        $albums = Album::load($_GET['genre']);
    } else {
        $albums = Album::load();
    }

    //This loop iterates through the $albums array and prints out the data for each album
    for($i=0; $i<count($albums); $i++){
        print_r("<p>");
        $albums[$i]->getData();
        print_r('</p>');
    }
?>
