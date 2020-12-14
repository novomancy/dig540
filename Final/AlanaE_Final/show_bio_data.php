<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once("./includes/db_config.php");
    include_once("./includes/Biography.php");

    //$bios = Biography::load();
    
    if(isset($_GET['tag']) && $_GET['tag'] != ''){
        $bios = Biography::load($_GET['tag']);
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
