<?php
$file_handle = fopen('./albumlist.csv', 'r');
// 'r' means read only
$first_line = fgetcsv($file_handle);
for($i=0; $i<count($first_line); $i++){ 
    //no semicolon at the end of a curly brace because of the loop
    print_r('Column header found: '.$first_line[$i].'<br>');
}
while($data_row = fgetcsv($file_handle)){
    //for loop had i=0, while loop will continue running until it runs out of data
    print_r("<p> This is the #$data_row[0] album:<br>");
    //single quote is a litteral string
    //double quote is a string but indicates variable name
    //here its $data_row
    for($i=1; $i<count($data_row); $i++){
        //loop inside a loop
        //if statement is consitional (true or false)
        if($i < 4){
            print_r("$first_line[$i]: $data_row[$i]<br>");
        } else {
            //executes anytime i<4 is false
            $genres = str_getcsv($data_row[$i]);
            for($j=0; $j<count($genres); $j++){
                print_r("$first_line[$i] #".($j+1)." is $genres[$j]<br>");
                //$j us used because we already have $i in the loop
            }

        }
    }
    print_r('<p>');
}
fclose($file_handle);
//anytime you use fopen you need to fclose
?>