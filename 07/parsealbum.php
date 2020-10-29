<?php
    // This file is a PHP file. It will be executed when you load
    // it on a web server.

    // The goal of this PHP is to open a .csv file, read each line in it, and then render
    // those lines out to the browser.

    // First, let's open the file. It's in the same directory as this .php file and is called albumlist.csv
    // To do that, we use a function called fopen
$file_handle = fopen('./albumlist.csv', 'r');

$first_line = fgetcsv($file_handle);

for($i=0; $i<count($file_line); $i++){
    //We're now inside a loop.
    print_r('Column header found: '.$first_line[$i].'<br>');
}

//We'll use a different type of loop this time: a while loop. 
while($data_row = fgetcsv($file_handle)){ 
    //This loop will execute as many times as there are rows.
    print_r ("<p>This is the #$data_row[0] album:<br>");
    //Now let's just loop through the rest of the data.
    for($i=1; $i<count($data_row); $i++){
        if($i < 4){
            print_r("$first_line[$i]: $data_row[$i]<br>");
        } else {
            $genres = str_getcsv($data_row[$i]);

            for($j=0; $j<count($genres); $j++){
                print_r("$first_line[$i] #". ($j+1)." is $genres[$j]<br>");
            }
        }
    }
    print_r('</p>');
}

fclose($file_handle);
?>