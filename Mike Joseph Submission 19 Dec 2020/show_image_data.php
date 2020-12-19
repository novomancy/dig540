<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    
    include_once('./includes/database_config.php');
    include_once('./includes/Exhibit.php');
    
    if(isset($_GET['title']) && $_GET['title']!= ' '){
	                $exhibits = Exhibit::load_by_id($_GET['id']);

	     }  else{
	    
    
    $exhibits = Exhibit::load();}
    

    for($i=0; $i<count($exhibits); $i++){ $k=0;
               $k=$i+1;
        print_r("<p>");

        $exhibits[$i]->getData();

        print_r('</p>');
    }

?>