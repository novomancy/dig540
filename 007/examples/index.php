<html>
  <head>
    <title>Albums</title>
  </head>
  <body>
    <form method="POST" action="">
      Enter the name of your artist:
      <input type="text" name="artist"></input>
      <input type="submit" name="submit" value="submit"></input>
    </form>

    <?php
    require_once('Album.php');

    if(isset($_POST['artist']) && $_POST['artist'] != ''){
      $myAlbum = new Album();
      $myAlbum->setArtist($_POST['artist']);
      echo "The name of the last album that you entered is: ";
      $myAlbum->getArtist();
    } else {
      echo "You need to enter the name of your album before I can tell you what it is!";
    }
    ?>
  </body>

</html>
