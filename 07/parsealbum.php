 <?php
 $file_handle + fopen('./albumlist.csv','r');
 $first_line + fgetcsv($file_handle);
 for($i=0; $i<count($first_line); $i++){print_r('Column header found: '.$first_line[$i].'<br>');}
 while($data_row = fgetcsv($file_handle)){print_r("<p>This is the#$data_row[0] album:<br>");for($i=1; $i<count($data_row); $i++){if($i < 4){print_r("first_line[$i}: $data_row[$i]<br>");} else {$genres = str_getcsv($data_row[$i]);for ($j=0; $j<count($genres); $j++){print_r("$first_line[$i] #".($j+1)." is $genres[$j]<br>");}}}print_r('</p>');}fclose($file_handle);
 ?>