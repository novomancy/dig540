<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once("./includes/db_config.php");
    include_once("./includes/Biography.php");
    
    if(isset($_GET['artist']) && $_GET['artist'] != ''){
      $bios = Biography::load($_GET['artist']);    
    } else if (isset($_GET['tags']) && $_GET['tags'] != ''){
        $bios = Biography::load_by_tag($_GET['tags']);
    } else if(isset($_GET['format']) && $_GET['format'] != ''){
        $bios = Biography::load_by_format($_GET['format']);
    } else {
      $bios = Biography::load();
    }   
?>

<!doctype html>
<html lang="en">
  <head>
    <title>List of all artist biopics</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  </head>
  <body>
    <h1>List of all Artist Biopics:</h1>
    <p><strong>This collection began as a list of dramatized films about artists and their lives, and grew to include films that were based on historical fiction novels, as well as documentary films, autobiographies, and memoirs.</strong></p>
    <a href="list_bios_data.php"><span style="color: purple;">Return to List of All biopics</span></a><br></p>
    
    <?php
    //This loop iterates through the $bios array and prints out the data for public function getTitleLink()
      for($i=0; $i<count($bios); $i++){        
          $bios[$i]->getTitleLink();        
      }    
    ?>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
  </body>
</html>