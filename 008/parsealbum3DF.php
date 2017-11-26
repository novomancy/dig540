<?php
error_reporting(E_ALL); 
ini_set("display_errors", 1); 


$file_handle = fopen('./albumlist.csv', 'r');


$first_line = fgetcsv($file_handle);



for($i=0; $i<count($first_line); $i++){
    
    print_r('Column header found: '.$first_line[$i].'<br>');
}
    
//one closed loop above
   
while($data_row = fgetcsv($file_handle)){
    

    print_r("<p>This is the #$data_row[0] album:<br>");

}
//one closed loop above

    for($i=1; $i<count($data_row); $i++){
        //loop opening here, then another loop below
        if($i < 4){

           print_r("$first_line[$i]: $data_row[$i]<br>");
        
    //this "if" is closed below where the else is, and another loop opens

        } else {

            $genres = str_getcsv ($data_row[$i]);}

            //else loop closes

            for($j =0; $j<count($genres); $j++){

                //another loop opens and then closes after the print_r function.

                print_r("$first_line[$i]#".($j+1)." is $genres[$j]<br>");
            }
        //this curly closes the loop that begins on line 42
       
    print_r ('</p>');

    }
        //this closes the loop that begins with for statement on line 28

fclose ($file_handle);
?>

