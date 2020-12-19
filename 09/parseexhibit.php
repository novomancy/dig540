<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    
    include_once('./includes/database_config.php');
    include_once('./includes/Exhibit.php');
    
       //open the file 
        
    $file_handle = fopen('./exhibit.csv', 'r');

    $first_line = fgetcsv($file_handle);

    for($i=0; $i<count($first_line); $i++){
        print_r('Column header found: '.$first_line[$i].'<br>');
    }  // column headers now printed
        
        $exhibit = array();
        $exhibits = array();
    while($data = fgetcsv($file_handle)){
	    $exhibit = new Exhibit();
	    $exhibit->setData($data);	
	     
        array_push($exhibits, $exhibit); 
        
   }

   for($i=0; $i<count($exhibits); $i++){
	           $k=0;
               $k=$i+1;
          
        
         
       if ($k%2 == 0) {print_r("<span style= 'color:red'> Image # ". $k . " of the exhibit: </span><br>");
       }
       else {print_r("<span style= 'color:green'> Image # " . $k . " of the exhibit: </span><br>");
       }
       print_r('</p>');
       $exhibits[$i]->getData();
        
        }

    fclose($file_handle);
?>

