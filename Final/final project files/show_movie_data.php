<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once("./includes/db_config.php");
    include_once("./includes/Movie.php");

    if(isset($_GET['genre']) && $_GET['genre'] != ''){
        $movies = Movie::load($_GET['genre']);
    } else {
        $movies = Movie::load();
    }
    
    for($i=0; $i<count($movies); $i++){
        print_r("<p>");
        $movies[$i]->getData();
        print_r('</p>');
    }
?>

