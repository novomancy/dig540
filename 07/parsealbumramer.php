<?php
// This file is a php file. It will be executed 
// when you load it on a webserver.

// The goal of this PHP file is to open a .csv file, read each line in it, 
// and then render those lines out to the browser.

// First, let's open the file. It's in the same directory as this PHP file, and it is called
// albumlist.csv. To do that, we use a function called fopen.

$file_handle = fopen('./albumlist.csv', 'r');

//File handle is a variable. Right now that variable is pointing at the very beginning of albumlist.csv
//Let's read in the first line.

$first_line = fgetcsv($file_handle);

//first line now contains the first line of data from the file. In this case, we know that the 
//first line is a header row with column names in it. Also, because we told PHP this is a csv
//file, it automatically seperated out each item into the row into a data type called an array.  Arrays
//are a kind of variable that contain multiple pieces of data under the same variable name. You refer to
//individual items in an array with a numbered index that starts at 0. For instance, the first item in the
//$first_line array could be accessed by typing $first_line[0], the second item would be $first_line[1] etc.
//Let's do something with those headers.

for($i=0; $i<count($first_line); $i++){ 
    //We are now inside a loop. This loop will execute as many times as there are items in the
    //$first_line array and will keep track of which iteration of the loop we're on in the $i variable.
    //Therefore, no matter which iteration of the loop we're on, we can access the current item in the 
    //$first_line array by writing $first_line[$i]. For now, let's just print them out.

    //printing, in this case uses a fuction called 'print_r'. I'm going to give print_r a string of text
    //that will combine with the value of the $first_line variable every time it iterates through the loop. Then
    //I'm taking another string ('<br>') on to the end of it. That's an HTML tag that indicates a line break.
    print_r('Column header found: '.$first_line[$i].'<br>');
}

//While we could keep going and get every line of data individually, it's faster to get each line
//in another loop. We'll use a different kind of loop this time, a While loop.
while($data_row = fgetcsv($file_handle)){
    //This loop will execute as many times as there are lines in the csv file, (beginning with the second row, 
    //since we already read the first row earlier.) It will store each row in the $data_row variable, which is
    //an array like $first_line was.  Right now let's just pring out each row with a little bit of formatiing.

    //First lets print out an introductory line for each album. By looking at the data file we know the first column
    //is the number of the album. Let's use that here. I'll use another HTML tag, in this case the paragraph tag.
    //Unlike <br> the <p> tag needs to wrap the text that it turns into a paragraph so it begins with a <p> and 
    //ends with a </p>. I'll open the paragraph here, and close it at the end of the while loop below.
    print_r("<p>This is the #$data_row[0] album:<br>");

    //Now let's just loop through the rest of the data. Note that while we're still using $data_row[0]
    //above, we can start at $i at 1 in this loop. I will also take advantage of the fact that $first_line has the
    //has the same indexing as $data_row, so for every iteration of the loop the header in $first_line[1] will
    //correspond with the data in $data_row[1].
    for($i=1; $i<count($data_row); $i++){
        //Hey, this is a loop inside another loop. Yep, you can do that.

        //Now another thing we know about the data file is that in indexes both 4 and 5 of each row
        //that are genre and subgenre. These two fields are comma delimted lists that can contain
        //multiple items in one data slot. We'll treat those items differently than the columns.
        //To do so, we need to add a conditional statement to the code-in this case an if statement.
        //We want one thing to happen if $i is 1 2 or 3 and another thing to happen if it is 4 or 5.
        if($i<4){
            //$i starts at 1 and increases by 1 each loop, so it can only be 1 2  or 3 in this branch
            //These data items are fine as-is so we can just print them out.
            print_r("$first_line[$i]: $data_row[$i]<br>");

        } else {
            //Since 1 2 3 are handled above and the loop ends at 5, only 4 and 5 can go here
            //These are the genre and subgenre fields. Let's split them up based on the commas.
            //The str_getcsv is like the f_getcsv function, but instead of operating on a 
            //title, it splits up a string of text that's already in memory. We want it to split 
            //up the string that's stored in $data_row[1]. $genres will be an array again
            //just like the result of fgetcsv was above. (Note that the variable name $genres will
            //contain genres and subgenre data on different iterations of the loop!)
            $genres = str_getcsv($data_row[$i]);

            //Now we need to do something with each genre. Let's print each of them out in its own 
            //numbered line. We can do that with another nested loop (we're three levels deep now). We can
            //use another for loop, but since $i is aleady keeping track of where we are in the 
            //$data_row array we need to use a different variable name to keep track of where we are in $genres.
            //$j for that.
            for($j=0; $j<count($genres); $j++){
                //We have a problem though. $j is starting at 0. Computers may count from 0, but humans
                //typically don't. Instead of printing $j, let's print out $j+1 below. 
                print_r("$first_line[$i] #".($j+1)." is $genres[$j]<br>");
            }
        }
    }
    //And here's the closing <p> tag that I promised above.
    print_r('</p>');
}


//Since we opened a file at the beginning of the script we have to close it at the end.
fclose($file_handle);
?>