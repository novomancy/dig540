<?php
//Week 7 php file test

//Parses albumlist.csv file and displays info for each row entry

//Get handle for albumlist file

$file_handle = fopen('./albumlist.csv', 'r' );


// Get the first line

$first_line = fgetcsv($file_handle);


//Print elements in first line to show column headers

for ($i=0; $i<count ($first_line); $i++){

	print_r('Column header found : '.$first_line [$i] .'<br>' );

}



//Loop through each row

while($data_row = fgetcsv($file_handle)){
    
    
//Display album no. which is first column

print_r("<p>This is the #$data_row[0] album: <br>");

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

?>



	
