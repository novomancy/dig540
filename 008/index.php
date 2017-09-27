<?php
require_once('config.php');
require_once('contributor.php');

if(isset($_POST['submit'])){
  $contributor = new Contributor($_POST['name'], ['birth'], ['death']);
  $contributor->create();
}

?>

<html>
  <head>
    <title>Composers of Film Music</title>
  </head>

  <body>
    <form method="POST" action="">
      Enter the name of the composer:
      <input type="text" name="name"></input><br />

        Enter the date the composer was born:
      <input type="text" name="birth"></input><br />

          Enter the date the composer died, if applicable:
      <input type="text" name="death"></input><br />

      <input type="submit" name="submit" value="submit"></input><br />
    </form>

    <?php if(isset($Contributor)){ ?>
        <p>The last composer entered was "<?php echo $contributor->name; ?>". That person was given ID <?php echo $contributor->id ?> in the database.</p>
    <?php } else {
      $contributor = contributor::read(1);
    ?>
        <p>The first composer entered was "<?php echo $contributor->name; ?>". That person was given ID <?php echo $contributor->id ?> in the database.</p>
    <?php } ?>

    <br /

    <form method="POST" action="">
        Enter the name of the composer you want to search for:
      <input name="searchName" type="text" id="target">
      <input type="submit" value="Search">
    </form>


  </body>

</html>
