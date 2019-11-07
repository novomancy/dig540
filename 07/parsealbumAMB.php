<?php
// this starts the php script

$file_handle = fopen('./albumlist.csv', 'r');
// this function opens the album list file we are supposed to work with

$first_line = fgetcsv($file_handle);
// this line reads the first line of data from the file 
// using this also indicates it is a csv file so the script will know how to
// format it automatically

for($i=0; $i<count($first_line); $i++){
// this line starts a loop that will execute as many times as there are items in the loop
// the curly brackets open and close the loop

    print_r('Column Header Found : '.$first_line[$i].'<br>');
}

// this is a function that prints the line with a string of text that will combine
// with the variable every time it goes through the loop. The br adds a line break
// each time
// also the bracket closed the first loop


while($data_row = fgetcsv($file_handle)){
// this is another loop that will get each line of data in another loop
// this loop will execute as many times as there are rows in the csv file
// $data_row is a new variable

print_r("<p> This is the #$data_row[0] album:<br>");

    for($i=1; $i<count($data_row);$i++){
    // loops in loops

    if($i<4){
        print_r("$first_line[$i]: $data_row[$i]<br>");



}else {
    $genres = str_getcsv($data_row[$i]);

    for($j=0; $j<count($genres); $j++){

        print_r("$first_line[$i] #".($j+1)." is $genres[$j]<br>");
        }
    }
}

print_r('<p>');
}

fclose($file_handle);
?>


