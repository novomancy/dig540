<html>
  <head>
    <title>User Name Generator</title>
  </head>

  <body>

    <form method="POST" action"">
    Enter your name <br />
    First Name: <input type="text" name="firstName" /></input><br />
    Last Name: <input type="text" name="lastName" /></input><br />

    <input type="submit" value="Click Here" /></input><br />
    </form>


  <?PHP

    require_once('week7.php');


  if(isset($_POST['firstName']) && ($_POST['lastName'] != ''))
  {
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];

    echo "Welcome $firstName.<br />";
    echo "Your last name is $lastName<br />";
  }

  if(empty($_POST['firstName']) || empty($_POST['lastName'])) {

    echo 'You forgot to enter your name.<br />';
  }
  ?>

  <hr />

  <?php

  for($i=0; $i <5; $i++)
  {
  $x=7;
    echo "This is week $x PHP assignment.<br />";
  }

  $i=1;
  $y=8;
  while($i<=5){
    echo "Next week will be week $y of the class.<br />";
  $i = $i + 1;
  }

  $i=5;
  if($i==5){
    echo 'There are 7 more weeks of class.<br />';
  } else {
    echo 'Not that I\'m counting.<br />';
  }

  $bird_species = array('Chickadee', 'Blue Jay', 'Cardinal', 'Titmouse');
  for($i=0; $i<4; $i++){
    bird($bird_species[$i]);
  }

  function bird($species){
    echo 'The bird on the feeder is a '.$species.'.<br />' ;
  }
  ?>
  </body>
</html>
