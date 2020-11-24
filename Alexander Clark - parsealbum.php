<?php
// This file is a PHP file.  It will be executed when you load
// it on a web server.

// The goal of this PHP is to open a .csv file, read each line in it, and then render
// those lines out to the browser.

// First, let's open the file.  It's in the same directory as this .php file and is called AlbumList.csv
// To do that, we use a function called fopen

$file_handle = fopen('./AlbumList.csv', 'r');

// $file_handle is a variable.  Right now that variable is pointing at the very beginning of AlbumList.csv.
// Let's read in the first line.

$first_line = fgetcsv($file_handle);

// $first_line now contains the first line of data from the file.  In this case, we know that the first
// line is a header row with column names in it.  Also, because we told PHP that this is a csv file, it
// automatically separated out each item in the row into a data type called an array.  Arrays are a kind
// of variable that can contain multiple pieces of data under the same variable name.  You refer to
// individual items in an array with a numbered index that starts at 0.  For instance, the first item
// in the $first_line array could be accessed by writing $first_line[0], the second item would be
// $first_line[1], etc.  Let's do something with those headers.

for($i=0; $i<count($first_line); $i++){print_r('Column header found: '.$first_line[$i].'<br>');}

// While we could keep going and get every line of data individually, it's faster to get each line
// in another loop.  We'll use a different type of loop this time: a while loop.

while($data_row = fgetcsv($file_handle)){print_r("<p>This is the #$data_row[0] album:<br>");for($i=1; $i<count($data_row); $i++){if($i < 4){print_r("$first_line[$i]: $data_row[$i]<br>");} else {$genrres = str_getcsv($data_row[$i]); for($j=o; $j<count($genres); $j++){print_r("$first_line[$i] #".($j+1)." is $genres[$j]<br>");}}}print_r('</p>');}

// Since we opened a file at the beginning of the script, we have to close it at the end.

fclose($file_handle);
?>
