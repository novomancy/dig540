<?php

require_once('config.php');
require_once('Biome.php');

if(isset($_POST['submit'])){
  $place = new Biome($_POST['name'], $_POST['climate'], $_POST['location']);
  $place->create();
}

?>

<html>
  <head>
    <title>Biomes</title>
  </head>
  <body>
    <form method="POST" action="">
      Enter the name of your biome:
      <input type="text" name="name"></input>
            Enter the climate of your biome:
      <input type="text" name="climate"></input>
            Enter the location of the biome:
      <input type="text" name="location"></input>
      <input type="submit" name="submit" value="submit"></input>
    </form>

<?php if(isset($place)){ ?>
    <p>The last place entered was "<?php echo $place->name; ?>". It was given Biomes_ID <?php echo $place>Biomes_ID ?> in the database.</p>
<?php } else {
  $place = Biome::read(1);
  ?>
    <p>The first place entered was "<?php echo $place->name; ?>". It was given Biome_ID <?php echo $place->Biome_Id ?> in the database.</p>
<?php } ?>

  </body>

</html>
