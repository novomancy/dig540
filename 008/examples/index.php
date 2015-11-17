<?php

require_once('config.php');
require_once('Artist.php');

if(isset($_POST['submit'])){
  $band = new Artist($_POST['name'], $_POST['origin'], $_POST['active_years']);
  $band->create();
}

?>

<html>
  <head>
    <title>Artists</title>
  </head>
  <body>
    <form method="POST" action="">
      Enter the name of your artist:
      <input type="text" name="name"></input>
            Enter the origin of your artist:
      <input type="text" name="origin"></input>
            Enter the years your artist was active:
      <input type="text" name="active_years"></input>
      <input type="submit" name="submit" value="submit"></input>
    </form>

<?php if(isset($band)){ ?>
    <p>The last band entered was "<?php echo $band->name; ?>". It was given ID <?php echo $band->id ?> in the database.</p>
<?php } else {
  $band = Artist::read(1);
  ?>
    <p>The first band entered was "<?php echo $band->name; ?>". It was given ID <?php echo $band->id ?> in the database.</p>
<?php } ?>

  </body>

</html>
