<?php
// This file is a PHP file. It will be executed when you load
// it on a web server.

// The goal of this PHP is to open a .csv file, read each line in it, and then render
// those lines out to the browser.

// First, let's open the file. It's in the same directory as this .php file and is called albumlist.csv
// To do that, we use a function called fopen

error_reporting(E_ALL); 
ini_set("display_errors", 1); 

$file_handle = fopen('./albumlist.csv', 'r');

// $file_handle is a variable. Right now that variable is pointing at the very beginning of albumlist.csv.
// Let's read in the first line.

$first_line = fgetcsv($file_handle);

// $first_line now contains the first line of data from the file. In this case, we know that the first
// line is a header row with column names in it. Also, because we told PHP that this is a csv file, it
// automatically separated out each item in the row into a data type called an array. Arrays are a kind
// of variable that can contain multiple pieces of data under the same variable name. You refer to
// individual items in an array with a numbered index that starts at 0. For instance, the first item
// in the $first_line array could be accessed by writing $first_line[0], the second item would be 
// $first_line[1], etc. Let's do something with those headers.

for($i=0; $i<count($first_line); $i++){
    //We're now inside a loop. This loop will execute exactly as many times as there are items in the
    //$first_line array and will keep track of which iteration we're on in the $i variable. Therefore,
    //no matter which iteration of the loop we're on, we can access the current item in the $first_line
    //array by writing $first_line[$i]. For now, let's just print them out.

    //printing, in this case, uses a function called 'print_r'. I'm going to give print_r a string of
    //text that it will combine with the value of the $first_line variable every time it iterates through
    //the loop. Then, I'm taking another string ('<br>') on to the end of it-that's an HTML tag that
    //indicates a line break.
    print_r('Column header found: '.$first_line[$i].'<br>');
}

// While we could keep going and get every line of data individually, it's faster to get each line
// in another loop. We'll use a different type of loop this time: a while loop.
while($data_row = fgetcsv($file_handle)){
    //This loop will execute as many times as there are rows in the csv file, beginning with the
    //second row (since we already read the first row earlier). It will store each row in the
    //$data_row variable, which is an array like $first_line was. Right now, let's just print
    //out each row with a little bit of formatting.

    //First, let's print out an introductory line for each album. By looking at the data file,
    //we know that the first column is the number of the album. Let's use that here. I'll use another
    //HTML tag, in this case the paragraph tag. Unlike <br>, the <p> tag needs to wrap the text that
    //it turns into a paragraph so it begins with <p> and closes with </p>. I'll open the paragraph
    //here and then close it at the end of the while loop below.
    print_r("<p>This is the #$data_row[0] album:<br>");

    //Now let's just loop through the rest of the data. Note that, since we're using $data_row[0]
    //above, we can start with $i at 1 in this loop. I will also take advantage of the fact that 
    //$first_line has the same indexing as $data_row, so for every iteration of the loop the 
    //header in $first_line[$i] will correspond with the data in $data_row[$i].
    for($i=1; $i<count($data_row); $i++){
        //Hey, this is a loop inside another loop! Yep, you can do that.

        //Now, another thing we know about the data file is that it index 4 and 5 of each row 
        //are genre and subgenre. Those two fields are comma delimited lists that can contain
        //multiple items in one data slot. We'll treat those a bit differently than the columns.
        //To do so, we need to add a conditional statement to the code-in this case, an if statement.
        //We want one thing to happen when $i is 1, 2, or 3, and something else to happen if $i is
        //4 or 5.
        if($i < 4){
            // $i starts at 1 and increases by 1 each loop, so $i can only be 1, 2, or 3 in this branch
            // These data items are fine as is, so we can just print them out.
            print_r("$first_line[$i]: $data_row[$i]<br>");

        } else {
            // Since 1, 2, and 3 are handled above and the loop ends after 5, only 4 and 5 can go here
            // These are the genre and subgenre fields. Let's split them up based on the commas.
            // The str_getcsv function is like the fgetcsv function, but instead of operating on a
            // file it splits up a string of text that's already in memory. We want it to split up 
            // the string that's stored in $data_row[$i]. $genres will be an array again, just like the
            // result of fgetcsv was above. (note that the variable name $genres below will contain both
            // genre and subgenre data on different iterations of the loop!)
            $genres = str_getcsv($data_row[$i]);

            //Now we need to do something with each genre. Let's print each one out in it's own numbered
            //line. We can do that with another nested loop (we're 3 levels deep now). We can use another
            //for loop, but since $i is already keeping track of where we are in the $data_row array we 
            //need to use a different variable name to keep track of where we are in $genres. Let's use
            //$j for that.
            for($j=0; $j<count($genres); $j++){
                //We have a problem though. $j is starting at 0. Computers may count from 0, but humans
                //typically don't. Instead of printing out $j, let's print out $j+1 below.
                print_r("$first_line[$i] #".($j+1)." is $genres[$j]<br>");
            }
        }
    }

    //...and here's the closing </p> tag that I promised above
    print_r('</p>');
}

//Since we opened a file at the beginning of the script, we have to close it at the end.
fclose($file_handle);
?>