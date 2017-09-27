
<?php
require_once('config.php');
require_once('Album.php');
if(isset($_POST['submit'])){
  $album = new Album($_POST['album_title'], $_POST['date'], $_POST['format']);
  $album->create();
}
?>

<html>
  <head>
    <title>Albums</title>
  </head>
  <body>
    <form method="POST" action="">
      Enter the name of your album:
      <input type="text" name="album_title"></input>
            Enter the release date:
      <input type="date" name="date"></input>
            Enter the album format:
      <input type="text" name="format"></input>
      <input type="submit" name="submit" value="submit"></input>
    </form>

<?php if(isset($album)){ ?>
    <p>The last album entered was "<?php echo $album->album_title; ?>". It was given ID <?php echo $album->id ?> in the database.</p>
<?php } else {
  $album = Album::read(1);
  ?>
    <p>The first album entered was "<?php echo $album->album_title; ?>". It was given ID <?php echo $album->id ?> in the database.</p>
<?php } ?>

  </body>

</html>
