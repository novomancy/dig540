<?php
require_once('CostumeModel.php');

?>

<html>
  <head>
    <title>Costume</title>
  </head>
  <body>

What will you be next Halloween?<br><br>

    <form method="post" action="CostumeControl.php">
      My name is:
      <input type="text" name="name"></input><br><br>

      On Halloween my costume will be:
      <input type="text" name="costume"></input><br>
      <input type="submit" name="submit" value="submit"></input>

    </form>

  </body>

</html>
