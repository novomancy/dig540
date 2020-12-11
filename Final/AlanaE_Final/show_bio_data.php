<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once("./includes/db_config.php");
    include_once("./includes/Biography.php");

    //Create an empty array that will be filled with Bios
    $bios = Biography::load();//rewrite load script part in Biography.php - got confused
    if(isset($_GET['tags']) && $_GET['tags'] != ''){
        $bios = Biography::load($_GET['tags']);
    } else {
        $bios = Biography::load();//refers to static method function in Biography.php
    }
    //This loop iterates through the $bios array and prints out the data for each biography
    for($i=0; $i<count($bios); $i++){
        print_r("<p>");
        $bios[$i]->getData();
        print_r('</p>');
    }
?>
