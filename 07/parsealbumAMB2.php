<?php
// this starts the php script

$file_handle = fopen('./albumlist.csv', 'r');
// variables start with the $ symbol
// fopen asks PHP to open the albumlist file and remember the location
// the location is stored in the variable $file_handle
// the r is for read only

$first_line = fgetcsv($file_handle);
// the fgetcsv function knows how to fetch data from the file but also that
// it should parse the lines it reads as fields in CSV format and put them 
// in an array format
// the $first_line is declaring a variable that now contains the first line in
// the albumlist file

for($i=0; $i<count($first_line); $i++){
/*
 a loop is a section of code a program executes multiple times based on some criteria. 
$i=0 initializes the loop counter value
The second part creates the test counter. This says that it will keep executing as long as there are items in the $first_line array
The third section is the increment counter 
the curly brackets open and close the loop
*/

    print_r('Column Header Found : '.$first_line[$i].'<br>');
/* 
print_r is the output part. It displays info in a way that is readable by humans.
This function will also add the text 'column header found' before every line that it pulls from the csv file. The br makes a line break  
*/
}

while($data_row = fgetcsv($file_handle)){
/* while is a new kind of loop. It loops through the code as long as the specified condition is true. It checks the condition at the start of the loop.    
$data_row is a new variable that holds each row of data from the file
*/

print_r("<p> This is the #$data_row[0] album:<br>");
// we are adding a text string to the data here too

    for($i=1; $i<count($data_row);$i++){
// loops in loops. $i++ returns the count, then increments
// count() is a function that returns the number of elements in an array

    if($i<4){
        print_r("$first_line[$i]: $data_row[$i]<br>");
	/* 
if...else is a conditional statement that will do one thing if the data is in columns 1 2 or 3 versus 4 or 5 (which are genre and subgenre and we want to format those differently) We are just printing out the first 3 columns as is, plus line breaks
*/

}else {
    $genres = str_getcsv($data_row[$i]);
/* 
else is the second part of the conditional if...else statement we just started. str_getcsv() is a function that parses a string for fields in csv format and returns an array containing the fields read
$genres is a new variable 
This is where it starts to get really confusing to me
*/
    for($j=0; $j<count($genres); $j++){

/*
 $j is a new variable to keep track of where we are in the new genres array. We are going to print out each genre in its own line, then each subgenre in its own line
*/

        print_r("$first_line[$i] #".($j+1)." is $genres[$j]<br>");
        }
    }
}

// closing so many loops. Hard to keep track

print_r('</p>');
}
// closing paragraph tag

fclose($file_handle);
// close the file we opened
// end the php script

?>
