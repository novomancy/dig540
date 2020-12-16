<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once("./includes/db_config.php");
    include_once("./includes/Movie.php");

    $file_handle = fopen('./movielist.csv', 'r');

    $first_line = fgetcsv($file_handle);

    for($i=0; $i<count($first_line); $i++){
        print_r('Column header found: '.$first_line[$i].'<br>');
    }

    $movies = array();
    
    while($data_row = fgetcsv($file_handle)){
        $movie = new Movie();
        $movie->setData($data_row);
        $movie->save();
        array_push($movies, $movie);
    }

    fclose($file_handle);
?>

