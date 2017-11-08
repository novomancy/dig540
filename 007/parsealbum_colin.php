
<?php
// This is a PHP file. It will be executued when it is donwloaded on a web server.

// The goal of this PHP is to open a new .csv file, read each line in it, 
// and then render those lines out to the browser.

// First, we will open the file. Its in the same directory as this php file.  
// It is called albumlist.csv. We'll use a funtion called fopen. 

$file_handle = fopen('./albumlist.csv', 'r');

// $file-handle is a variable. Currently that variable is pointing to the very beginning of albumlist.csv
// Let's read in the first line.

$first_line = fgetcsv($file_handle);

// $first_line now contains the first line of data from the file.  In this case, we know that the first line
// is a header row with column names in it. Also because we told php that this is a csv file, 
// it automatically separted out each item in the row into a data type called an array. Arrays are a kind of
// variable that can contain multiple pieces of data under that variable name. You refer to individual 
// items in an array with a numbered index that starts at 0.  For instance, the $first_line array
// could be accessed by writing $first_line[0].  The second items would be $first_line[1], and so on.
// Let's do something with those headers.

for($i=0; $i<count($first_line); $i++){
    // We are now inside a loop. This loop will execute as many times as there are items in the $first_line
    // array, and keep track of which iteration we are on in the $i variable.  Therefore, no matter 
    // which interation of the loop we are on, we can access the current item in the $first_line array
    // by writing $first_line[$i], etc. For now, let's just print them out.

    // Printing in this case uses a function called 'print_r'  We are going to give print_r a string of text
    // that it will combine with the value of the $first_line variable every time it interates through the loop.
    // Then, we'll place another string (<br>) on the other end of it--that's an HTML tag that indicates
    // a line break
    print_r('column header found: '.$first_line[$i].'<br>');
}

// While we could keep going, and get every line of data individually, its faster to get each line
//  in another loop.  We'll use a different type of loop this item, a while loop.
while($data_row = fgetcsv($file_handle)){
    // This loop will execute as many times as there are rows in the csv file, beginning with the second row
    // (since we already read the first row earlier.) It will store each row in the $data_row variable, 
    // which is an array like the $first_line was. Right now, we'll just print out each row with a 
    // little bit of formatting.

    // First, we'll print out an introductory line for each album. By looking at the data file, 
    // we know that this first column is the number of the album. We'll use that here. Let's use 
    // another HTML tag, in this case another paragraph tag. Unlike <br>, the <p> tag needs to wrap the text that
    // it turns into a paragraph so that it begins with <p> and closes witha </p>. We'll open the paragraph here
    // and close it a the end of the while loop, below.
    print_r("<p>This is the #$data_row[0] album:<br>");

    // Now, we'll just loop through the rest of this data. Note that since we aree using $data_row[0] above,
    // we can start with $i at 1 in this loop.  We'll also take advantage fo the fact that $first_line has the 
    // same indexing as $data_row, so for every iteration of the loop, the header in the $first_line will
    // correspond with the data in the $data_row[i], below.
    for($i=1; $i<count($data_row); $i++){

        // Note: This is loop within another loop! Yes, we can do that!

        // Now another thing we know about this data file is that it indexes 4 and 5 of each row as genre
        // and subgenre. These two fields are comma delimited lists that contain multiple itmes in one data slot.
        // We will treat these a bit differently from the columns.  
        // To do so, we need to add a conditional statement to the code, in this case, an if statement.
        // We want one thing to happen if $i is 1, 2 , or 3, and something else to happen if $i us 4 or 5.
        if($i < 4){
            // $i starts at 1 and increases by 1 each in this loop, so it can only be 1 or 2 or 3 in this branch.
            // These data items are fine as is, so we can just print them out.
            print_r("$first_line[$i: $data_row[$i]<br>");
        
        } else {
            // Since 1 and 2 and 3 are handled above, and the loop ends after 5, only 4 and 5 can go here
            // These are the genre and subgenre fields.  Let's split them up based on the commas. 
            // The str_getcsv funtion is like the fgetcsv function, but instead of operating on a file, it 
            // splits up a string of text that in already is already in the memory.  We want
            // it to split up the string that's stored in the $data_row. Genre will be an array again, 
            // just like the fgetcsv was above. (Note that the variable name $genres below will contain both
            // genre and subgenre data on different interations of the loop!)
            $genres = str_getcsv($data_row[$i]);

            // Now we need to do something with each genre. We'll print each one out in its own numbered 
            // line. We can do that with another nested loop--we are three levels deep now. We could use another
            // for loop, but since $i is already keeping track of where we are in the $data_row array, 
            // we need to use a different variable name to keep track of where we are in the $genres. We'll
            // use $j for that.
            for($j=0; $j<count($genres); $j++){
                 // We have a problem, though. $j is starting at 0. Computers may start count at 0, 
                 // but humans typically don't. We'll print out $j+1 below.
                 print_r("$first_line[$i] #".($j+1)." is $genres[$j]<br>);
             }
        }
    }

    //...and here's the closing </p> tag that was promised above
    print_r('</p>');
}

// Since we opened a file at the beginning of the script, we have to close it at the end. 
fclose($file_handle);
?>