<!doctype html>
<html lang="en">
  <head>
    <title>Shelley says hello!</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  </head>
  <body>
    <h1>Shelley says hello!</h1>
    <?php
//Week 8: this is the assignment: tags: Add a <div> tag before and a </div> tag after the list of column headers
//Add a <strong> tag before and a </strong> tag after every time it prints out the "This is the #n album" line
//Add a <span> tag around every second row of genres/subgenres so it looks like each line alternates colors
//Hint 1: You can determine if an integer is even by using if($j % 2 == 0) (see the modulus operator here: https://www.w3schools.com/php/php_operators.asp)
//Hint 2: I showed you how to change the color of text inside a span in one of the videos


$file_handle = fopen('./albumlist.csv', 'r' );


// Get the first line

$first_line = fgetcsv($file_handle);
print_r('<div>')

//Print elements in first line to show column headers

for ($i=0; $i<count ($first_line); $i++){

	print_r('Column header found : '.$first_line [$i] .'<br>' );

}
('</div>');


//Loop through each row

while($data_row = fgetcsv($file_handle)){
    
    
//Display album no. which is first column

print_r("<p><strong><p>This is the #$data_row[0] album: </strong><br>");

    //Start at row 2
	for ($i =1; $i<count($data_row) ; $i++){
	
    //Display Year thru Artist 
	if ($i < 4){

		print_r("$first_line[$i]: $data_row[$i] <br>");


    //Display Genre and Subgenres
	} else {

	$genres = str_getcsv($data_row[$i]);


	for ($j=0; $j<count($genres); $j++){

	print_r("$first_line[$i] #".($j+1)." is $genres[$j]<br>");
	
}
}
}

//Close paragraph of row display
print_r('</p>');

//Close while loop
}

//Close file
fclose($file_handle);

if ($condition) {
    ?>
    <b>This is true.</b>
    <?php
 } else {
    ?>
    <b>This is false.</b>
    <?php
 }?>

?>



    <p style="font-size: 2em;">
        Lorem <span style="color: red;">Ipsum</span>...
    </p>
    <p>
        This HTML file is for reference only. You should be working in the .php version!
    </p> echo ""
<?php

?>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
  </body>
</html>