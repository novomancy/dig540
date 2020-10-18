<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once ('./includes/db_config.php'); 
    include_once ('./includes/Pokemon.php'); 

    // creates an empty array to be filled with pokemon
    if(isset($_GET['type']) && $_GET['type'] != ''){
        $pokemons = Pokemon::load($_GET['type']);
    } else {
    $pokemons = Pokemon::load();
    }
?>

<!doctype html>
<html lang="en">
  <head>
    <title>PokemonGo Database</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  </head>
  <body>
    <h1>Here are the Pokemon in the Database</h1>

<?php

    // this loop goes through the $albums array i just made and prints out the data for each pokemon
    for($i=0; $i<count($pokemons); $i++){
       print_r("<p>");
        $pokemons[$i]->getData();
        print_r('</p>');
    }

?>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
</body>
</html>