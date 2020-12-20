<!doctype html>
<html lang="en">
  <head>
    <title>Album Data from Professor John Bell</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  </head>
  <body>
    <h1>Album Data and Other Interesting Musical Things from Professor John Bell that was Edited by Alexander Clark</h1>

    <?php

      $file_handle = fopen('./AlbumList.csv', 'r');
      $first_line = fgetcsv($file_handle);
      for($i=0; $i<count($first_line); $i++){print_r('Column header found: '.$first_line[$i].'<br>');}
      while($data_row = fgetcsv($file_handle)){print_r("<p>This is the #$data_row[0] album:<br>");for($i=1; $i<count($data_row); $i++){if($i < 4){print_r("$first_line[$i]: $data_row[$i]<br>");} else {$genres = str_getcsv($data_row[$i]);
      for($j=0; $j<count($genres); $j++){print_r("$first_line[$i] #".($j+1)." is $genres[$j]<br>");}}}print_r('</p>');}
      fclose($file_handle);


    ?>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

    <?php
      for($i=0; $i<100; $i++){echo "Pie is delicious and better than cake!<br>\n";}
    ?>

    <?php
    echo "Today is " . date("Y/m/d") . "<br>";
    ?>

    <?php
    echo "The time is " . date("h:i:sa");
    ?>


  </body>
</html>
