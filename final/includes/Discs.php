<?php
 class Disc{
     private $ID;
     private $Title;
     private $Year;
     private $ArtistID;
     private $Artist;
     private $ComposerID;
     private $Composer;
     private $ImageURL;


     public function setID($idNumber){
        $this->ID = $idNumber;
     }
     public function getID(){ 
        print_r( 'ID: '.$this->ID . '<br>'); 
     }
     public function setTitle($titleName){ 
        $this->Title = $titleName; 
     }
     public function getTitle(){ 
        print_r('Title: '.$this->Title . '<br>'); 
     }
     public function setYear($releaseYear){ 
        $this->Year = $releaseYear; 
     }
     public function getYear(){ 
        print_r('Year: '.$this->Year . '<br>');
     } 
     public function setArtistID($artistNumber){ 
        $this->ArtistID = $artistNumber;
     }
     public function getArtistID(){ 
         print_r('ArtistID:'.$this->ArtistID . '<br>'); }
     }
     public function setArtist($artist){ 
         $this->Artist = $artist;
     }
     public function getArtist(){ 
        print_r('Artist:'.$this->Artist . '<br>'); }
    }
    public function setComposerID($composerNumber){ 
        $this->ComposerID = $composerNumber;
     }
    public function getComposerID(){ 
        print_r('ComposerID:'.$this->ComposerID . '<br>'); }
     }
    public function setComposer($composer){ 
        $this->Composer = $composer;
     } 
    public function getComposer(){  
        print_r('Composer:'.$this->Composer . '<br>'); }

    public function setImageURL($imageURL){ 
        $this->ImageURL = $imageURL;
     }
    public function getImageURL(){ 
        print_r('ImageURL:'.$this->ImageURL . '<br>'); }
     }   
     public function setData($data_row){
        $this->setID($data_row[0]);
        $this->setTitle($data_row[1]);
        $this->setYear($data_row[2]);
        $this->setArtistID($data_row[3]);
        $this->setArtist($data_row[4]);
        $this->setComposerID($data_row[5]);
        $this->setComposer($data_row[6])
        $this->setImageURL($data_row[7]);   
     }
     public function getData(){
        $this->getID();
        $this->getTitle();
        $this->getYear();
        $this->getArtistID();
        $this->getArtist();
        $this->getComposer();
        $this->getComposerID();
        $this->getImageURL();
     }


 }

 $file_handle = fopen('./disc.list.csv', 'r');

 $first_line = fgetcsv($file_handle);

 for($i=0; $i<count($first_line); $i++){
     print_r('Column header found: '.$first_line[$i].'<br>');
 }

 $discs = array();
 
 while($data_row = fgetcsv($file_handle)){
    $disc = new Disc();
    $disc->setData($data_row);
     array_push($albums, $album);
 }

 for($i=count($discs)-1; $i>=0; $i--){
     print_r("<p>This is the #$i disc:<br>");
     print_r('</p>');
 }

 fclose($file_handle);
?>