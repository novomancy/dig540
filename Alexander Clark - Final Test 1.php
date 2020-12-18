<?php
    error_reporting(E_ALL);
    ini_set("display_errors", 1);

    class Album{
        private $artist;
        private $album;
        private $totalsongs;
        private $year;
        private $genre;
        private $composer;

        public function setArtist($artistName){ $this->artist = $artistName; }
        public function getArtist(){ print_r( 'Artist: '.$this->artist . '<br>'); }
        public function setAlbum($albumName){ $this->album = $albumName; }
        public function getAlbum(){ print_r('Album: '.$this->album . '<br>'); }
        public function setTotalSongs($totalsongsNumber){ $this->totalsongs = $totalsongsNumber; }
        public function getTotalSongs(){ print_r('TotalSongs: '.$this->totalsongs . '<br>'); }
        public function setYear($Year){ $this->year = $Year; }
        public function getYear(){ print_r('Year: '.$this->year . '<br>'); }
        public function setGenre($genre){ $this->genre = $genre; }
        public function getGenre(){ print_r('Genre: '.$this->genre . '<br>'); }









        public function setData(){
          $this->artist = $artist;
          $this->album = $album;
          $this->totalsongs = $totalsongsNumber;
          $this->year = $year;
        }

        public function getData(){
          $this->getArtist();
          $this->getYear();
          $this->getTotalSongs();
          $this->getAlbum();
          $this->getGenre();
          $this->getComposer();
        }


    }

    $file_handle = fopen('./ClarkSomeAlbumsInCollection.csv', 'r');

    $file_handle = fopen('./Anberlin Dark is the Way Light is a Place.png', 'r');
    $file_handle = fopen('./Deadmau5 Random Album Title Song.png', 'r');
    $file_handle = fopen('./Muse Black Holes and Revelations.jpg', 'r');
    $file_handle = fopen('./Rammstein Reise Reise.png', 'r');
    $file_handle = fopen('./Tool Fear Inoculum Edit.png', 'r');






    $first_line = fgetcsv($file_handle);

    for($i=0; $i<count($first_line); $i++){
        print_r('Column header found: '.$first_line[$i].'<br>');
    }

    $albums = array();

    while($data_row = fgetcsv($file_handle)){
        $album = new Album();
        $album->setArtist($data_row[3]);
        $album->setAlbum($data_row[2]);
        $album->setTotalSongs($data_row[0]);
        $album->setYear($data_row[1]);
        $album->setGenre($data_row[4]);
        $album->setComposer($data_row[5]);
        array_push($albums, $album);
    }

    for($i=count($albums)-1; $i>=0; $i--){
        print_r("<p>This is the #$i album:<br>");

        $albums[$i]->getData();

         $albums[$i]->getAlbum();
         $albums[$i]->getYear();
         $albums[$i]->getTotalSongs();
         $albums[$i]->getArtist();
         $albums[$i]->getGenre();
         $albums[$i]->getComposer();
        print_r('</p>');
    }

    fclose($file_handle);







?>
