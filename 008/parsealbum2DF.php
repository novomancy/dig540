<?php
error_reporting(E_ALL); 
ini_set("display_errors", 1); 
//this is a new PHP file. It will be executed when you load it on a web server.

//The goal of this PHP is to pen a .csv file, read each line in it, and then render those lines to the browser.

//First I will attempt to open the file that is in the same directory as this PHP file and is called <albumlist class="csv"></albumlist>
//I will use the function call fopen.

$file_handle = fopen('./albumlist.csv', 'r');

//$file_handle is a variable, and is pointing at specific place in teh file. Right now that variable is point a the ver beginning of albumlist.csv.
//Now I will try to read the first line. All lines of code in PHP end in a semi-colon.

$first_line = fgetcsv($file_handle);

//fgetcsv is a function that does sometthing. $first_line is an array, meaning it contains a series of fields or similar (an array of choices).
//Here, the first line is ahead row with colum names in it. Also, b/c we told PHP that this is a csv file, it
//automatically separted out each item in the row into a data type called an array. Arrays are a kind of variable
//that can contain multiple pieces of data under the same variable name (not sure what that means).
// You refer to individual items in an array with a numbered index that starts at 0. 
//For instance, the first item inthe $first_line array could be accessed by writnig $first_line[0]. 
//the second would be [1], etc.

for($i=0; $i<count($first_line); $i++){
    //this is a loop. The loop will execute exactly as many times as there are items in the 
    //$first_line array adn will keep track of which iteration we're on in the same $i variable. 
    //Therefore, no matter which iteration fo the loop we're on, we can access the current item in the $first_line array by writing
    //$first_line[$i]

    //printing uses the code below. 
    //This code (below) will give print_r a sring of text that it will cobmine with the value of the $first_line variable
    //evry time it ierates through the loop. 
    //Then another string ('<br>') tacked onto the end will show a line break, as in HTML.
    
    print_r('Column header found: '.$first_line[$i].'<br>');
}
    
    //yntax error, unexpected ''.$first_line[$i].'' (T_CONSTANT_ENCAPSED_STRING) in /home/digitaly/public_html/dianne_album_data/parsealbum.php on line 37
    //tried to fix with double quotes; then put quotes outside the bracket.
    //but is sort of a subset of code.
    //period is used to glue the code to something else  -- not quite sure. Glues 2 strings together. Not sure what is being glued 
    //to what ?? BR is the break in a webrowser.

//Below is the "while loop".  Do not really understand the explanation, although I will copy it here.
//Instead of going and getting every line of data indivdually, it's faster to get each line in another loop 
//via the while loop.
   
while($data_row = fgetcsv($file_handle)){
    //This loop will execute as many times as there are rows in the csv file, beginning with the second row
    //(since we arleady read the first row ealire). It iwll store each row in teh $data_row variable, 
    //which is an aray like $first_line was. this will allow us to print out each line.

    //The code bleow allows us to print out an intro line for each album. 
    //From looking at teh data file, we know that the first column is the number of the album, so we will use that here.
    //THE HMTL code formats as typical (paragraph and space. 
    //The code below will open it and then later code will close the while loop.

    print_r("<p>This is the #$data_row[0] album:<br>");

//
    for($i=1; $i<count($data_row); $i++){

        if($i < 4){

           print_r("$first_line[$i]: $data_row[$i]<br>");

            print_r('<span style="color: red;">'"$first_line[$i]#".($j+1)." is $genres[$j]'</span><br>');

        } else {

            $genres = str_getcsv ($data_row[$i]);

            for($j =0; $j<count($genres); $j++){

                print_r("$first_line[$i]#".($j+1)." is $genres[$j]<br>");
            }
        }
    }    
    print_r ('</p>');

}

fclose ($file_handle);
?>

//html://digitalyctest.org/dianne_album_data/parsealbum.php