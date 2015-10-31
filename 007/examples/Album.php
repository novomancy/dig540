<?php
class Album{
  private $artist;
  private $tracks;

  public function setArtist($artistName){
    //error checking happens here
    $this->artist = $artistName;
  }

  public function getArtist(){
    echo $this->artist;
  }
}
?>
