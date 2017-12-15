<?php
 class Album{
     private $ID;
     private $Title;
     private $Year;
     private $Artist_id;
     private $Artist;
     private $Composer_id;
     private $Composer;
     private $Image_url;


     public function setID($idNumber){
        $this->ID = $idNumber;
     }
     public function getID(){ 
        print_r( 'ID: '.$this->id . '<br>'); 
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
        $this->ComposerID = str_getcsv($composerNumber);
     }
     public function getComposerID(){ 
        print_r('ComposerID:'.$this->ComposerID . '<br>'); }
     }
     public function setComposer($composer){ 
        $this->Composer = str_getcsv($composer);
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

     public function save(){
        global $pdo;

        try{
            $disc_insert = $pdo->prepare("INSERT INTO album (ID, Title, Year, Artist_ID, Artist, ImageURL)
                                            VALUES (?, ?, ? ,?, ?, ?)");
            $db_album = $album_insert->execute([$this->ID, $this->Title, $this->Year, $this->ArtistID, $this->Artist, $this->imageURL]);
            $this->ID = $pdo->lastInsertID();
            print_r("--Saved this title to the database"--<br>\n");

            $select_Composer = $pdo->prepare("SELECT * FROM Composer WHERE name = ?");
            $Composer_insert = $pdo->prepare("INSERT INTO Composer (name) VALUES (?);
            $Composer_link = $pdo->prepare("INSERT INTO album-composer (album_id, composer_id) VALUES (?, ?)")

            for($i=0; $i<count($this->Composer); $i++){
                $select_Composer->execute($this_Composer[$i]);
                $existing_Composer = $select_Composer->fetch();
                if (!$existing_Composer){
                    $db_composer = Composer_insert->execute([$this->Composer[$i]]);
                    $Composer_id = $pdo->lastInsertID();
                    $Composer_id = $existing_Composer['id'];
                }
                $Composer_link->execute([this->id], composer_id);
                print_r("Connected" . $this->Composer[$i]."to$this->Title<br>\n");
            }
            flush();
            ob_flush();

        } catch (PDOException $e){
            print_r("Error saving album to database: ".$e->getMessage() ."<br>\n")
            exit;

        }
     }
 }
?>
